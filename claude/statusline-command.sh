#!/bin/bash
# Claude Code status line — based on tahir3 zsh theme
# Line 1 (PS1-style): user ~ dir (git branch ✔/✗)
# Line 2 (session):   model | in:X out:Y | ctx:Z% used | $cost

input=$(cat)

user=$(whoami)
dir=$(echo "$input" | jq -r '.cwd // empty')
[ -z "$dir" ] && dir=$(pwd)

# Shorten home directory to ~
home="$HOME"
display_dir="${dir/#$home/~}"

# Git branch and clean/dirty status
git_info=""
if git -C "$dir" rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git -C "$dir" symbolic-ref --short HEAD 2>/dev/null || git -C "$dir" rev-parse --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    if git -C "$dir" --no-optional-locks status --porcelain 2>/dev/null | grep -q .; then
      git_info=" ($branch ✗)"
    else
      git_info=" ($branch ✔)"
    fi
  fi
fi

# --- Session metrics ---

model_display=$(echo "$input" | jq -r '.model.display_name // empty')
model_id=$(echo "$input" | jq -r '.model.id // empty')
total_input=$(echo "$input" | jq -r '.context_window.total_input_tokens // 0')
total_output=$(echo "$input" | jq -r '.context_window.total_output_tokens // 0')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
remaining_pct=$(echo "$input" | jq -r '.context_window.remaining_percentage // empty')

# Format token counts with k suffix
format_tokens() {
  local t=$1
  if [ "$t" -ge 1000 ]; then
    awk "BEGIN { printf \"%.1fk\", $t / 1000 }"
  else
    echo "$t"
  fi
}

input_fmt=$(format_tokens "$total_input")
output_fmt=$(format_tokens "$total_output")

# Estimated cost — model-aware pricing per million tokens (USD)
input_cost_per_m=3.00
output_cost_per_m=15.00
if echo "$model_id" | grep -qi "opus"; then
  input_cost_per_m=15.00
  output_cost_per_m=75.00
elif echo "$model_id" | grep -qi "haiku"; then
  input_cost_per_m=0.80
  output_cost_per_m=4.00
fi
cost=$(awk "BEGIN { printf \"%.4f\", ($total_input * $input_cost_per_m / 1000000) + ($total_output * $output_cost_per_m / 1000000) }")

# Context usage
ctx_info=""
if [ -n "$used_pct" ]; then
  used_int=$(printf "%.0f" "$used_pct")
  remaining_int=$(printf "%.0f" "${remaining_pct:-0}")
  ctx_info=" | ctx:${used_int}% used (${remaining_int}% left)"
fi

# Session name (if set via /rename)
session_name=$(echo "$input" | jq -r '.session_name // empty')
session_info=""
[ -n "$session_name" ] && session_info=" | session:${session_name}"

# --- ANSI colors ---
# Line 1: PS1-style colors from tahir3 theme
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
RESET='\033[0m'
# Line 2: dimmed colors for metrics
DIM_CYAN='\033[0;36m'
DIM_WHITE='\033[0;37m'
DIM_YELLOW='\033[0;33m'

# Line 1: PS1-style
printf "${YELLOW}%s${RESET} ${GREEN}%s${RESET}%s\n" "$user" "$display_dir" "$git_info"

# Line 2: session metrics
printf "${DIM_CYAN}%s${RESET} ${DIM_WHITE}| in:%s out:%s${RESET}${DIM_WHITE}%s${RESET} ${DIM_YELLOW}| \$%s${RESET}%s" \
  "$model_display" \
  "$input_fmt" "$output_fmt" \
  "$ctx_info" \
  "$cost" \
  "$session_info"
