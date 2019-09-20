if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="yellow"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"

PROMPT='%{$fg_bold[$NCOLOR]%}%n\
%{$reset_color%} %{$fg_bold[green]%}%~ \
$(git_prompt_info)
%{$fg_bold[white]%}%(!.#.(☛ ﾟヮﾟ%) ☛ )%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[yellow]%}("
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_bold[red]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg_bold[yellow]%})%{$reset_color%}"
