# ZSH Theme - Preview: https://cl.ly/f701d00760f8059e06dc
# Thanks to gallifrey, upon whose theme this is based
# maricn: Thanks to lukerandall, upon whose theme this is based

# maricn: disabled return code to make it nicer to copy paste terminal content
# local return_code="%(?..%{$fg_bold[red]%}%? ↵%{$reset_color%})"

function my_git_prompt_info() {
  ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
# maricn: added rev-parse fallback
      $(command git rev-parse --short HEAD 2> /dev/null) || \return
  GIT_STATUS=$(git_prompt_status)
  [[ -n $GIT_STATUS ]] && GIT_STATUS=" $GIT_STATUS"
  # maricn: shorten branch name (middle) in case too long
  branch="${${ref#refs/heads/}:0:12}%20<...<${${ref#refs/heads/}:12}%<<"
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX$branch$GIT_STATUS$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# maricn: use fish-like prompt pwd
setopt prompt_subst
PROMPT='%{$fg_bold[green]%}%n@%m%{$reset_color%} %{$fg_bold[blue]%}$(shrink_path -f)%{$reset_color%} $(my_git_prompt_info)%{$reset_color%}%B»%b '
# RPS1="${return_code}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow]%}("
ZSH_THEME_GIT_PROMPT_SUFFIX=")%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%%"
ZSH_THEME_GIT_PROMPT_ADDED="+"
ZSH_THEME_GIT_PROMPT_MODIFIED="*"
ZSH_THEME_GIT_PROMPT_RENAMED="~"
ZSH_THEME_GIT_PROMPT_DELETED="!"
ZSH_THEME_GIT_PROMPT_UNMERGED="?"

