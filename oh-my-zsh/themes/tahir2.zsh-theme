if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg_bold[$NCOLOR]%}%n@%{$reset_color%}%{$fg_bold[black]%}%m\
%{$reset_color%} ➜  %{$fg[green]%}%~ \
$(git_prompt_info)
%{$fg[white]%}%(!.#.☛ )%{$reset_color%} '
PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow]%})%{$reset_color%}"
