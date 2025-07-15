setopt PROMPT_SUBST

function ter_git()
{
    name="$(git_repo_name)"
    if [[ $name == "" ]];
    then
        return
    fi

    local icon="%{$fg[white]%}ᚵ%{$reset_color%}"
    local branch="%{$fg[cyan]%}$(git_current_branch)%{$reset_color%}"
    email="$(git_current_user_email)"
    if [[ $email == "teruncius@proton.me" ]];
    then
        user="%{$fg[red]%}$email%{$reset_color%}"
    else
        user="%{$fg[green]%}$email%{$reset_color%}"
    fi

    echo "${icon} ${user} ${branch}$(parse_git_dirty)$(git_commits_ahead)$(git_commits_behind)"
}

# Git
ZSH_THEME_GIT_PROMPT_DIRTY=" %{$fg[red]%}ᚾ%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=" %{$fg[green]%}ᛡ%{$reset_color%}"
ZSH_THEME_GIT_COMMITS_AHEAD_PREFIX="%{$fg[red]%}+"
ZSH_THEME_GIT_COMMITS_AHEAD_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_COMMITS_BEHIND_PREFIX="%{$fg[red]%}-"
ZSH_THEME_GIT_COMMITS_BEHIND_SUFFIX="%{$reset_color%}"

# Exit code

local ter_date="%{$fg[white]%}%*%{$reset_color%}"
local ter_dir="%{$fg[yellow]%}%~%{$reset_color%}"
local ter_exit_status="%(?,%{$fg[green]%}✓%{$reset_color%},%{$fg[red]%}✗%{$reset_color%})"
local ter_exit_code="%(?,,%{$fg[white]%} → %{$reset_color%}%{$fg[red]%}%?%{$reset_color%})"
local ter_nl=$'\n'
local ter_commands="${ter_nl} ${ter_exit_status} %{$fg[white]%}𝘧λ%{$reset_color%}${ter_exit_code} "

# Build the prompt
PROMPT='${ter_date} ${ter_dir} $(ter_git)${ter_commands}'
