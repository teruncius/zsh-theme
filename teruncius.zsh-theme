setopt PROMPT_SUBST

function ter_git()
{
    local icon="%{$fg[white]%}ᚵ%{$reset_color%}"
    local branch="%{$fg[cyan]%}$(git_current_branch)%{$reset_color%}"
    email="$(git_current_user_email)"
    if [[ $email == "teruncius@proton.me" ]];
    then
        user="%{$fg[red]%}$email%{$reset_color%}"
    else
        user="%{$fg[green]%}$email%{$reset_color%}"
    fi
    echo "${icon} ${user} ${branch}$(parse_git_dirty)%{$reset_color%}"
}

# Git
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}ᚾ"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}ᛡ"

# Exit code

local ter_date="%{$fg[white]%}%*%{$reset_color%}"
local ter_dir="%{$fg[yellow]%}%~%{$reset_color%}"
local ter_exit_status="%(?,%{$fg[green]%}✓%{$reset_color%},%{$fg[red]%}✗%{$reset_color%})"
local ter_exit_code="%(?,,%{$fg[red]%}[%?]%{$reset_color%})"
local ter_commands="%{$fg[white]%} 𝘧λ %{$reset_color%}"
local ter_nl=$'\n'

# Build the prompt
PROMPT='${ter_exit_status} ${ter_date} ${ter_dir} $(ter_git) ${ter_exit_code}${ter_nl}${ter_commands}'
