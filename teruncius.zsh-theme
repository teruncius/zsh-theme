# Git
local git_info='$(git_prompt_info)'
ZSH_THEME_GIT_PROMPT_PREFIX=" %{$fg[white]%}%{$reset_color%}ᚵ:%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}✗"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}✓"

# Exit code
local exit_code="%(?,,%{$fg[red]%}[%?]%{$reset_color%})"

# Build the prompt
PROMPT="%{$fg[white]%}%*%{$reset_color%} \
%(#,%{$bg[yellow]%}%{$fg[black]%}%n%{$reset_color%},%{$fg[cyan]%}%n)\
%{$fg[white]%}@\
%{$fg[green]%}%m\
%{$fg[white]%} \
%{$terminfo[bold]$fg[yellow]%}%~%{$reset_color%}\
${git_info}\
 $exit_code
%{$terminfo[bold]$fg[white]%}$ %{$reset_color%}"

