function ssh_connection() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%B%F{196}(ssh) %b%f %F{white}%n@%2m%f"
  fi
}

function my_git_prompt() {
  tester=$(git rev-parse --git-dir 2> /dev/null) || return
  git_status=$(git_prompt_status)
  if [ ! -z $git_status ]
     then
     git_status=" $git_status"
  fi
  echo "%b%F{white}‹%B%F{yellow} $(git_prompt_info)$git_status %b%F{white}›%f"
}

PROMPT=$'\n$(ssh_connection)%F{white}%~ $(my_git_prompt) \n%B%F{236}$%f%b '

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_AHEAD="%F{magenta}↑"
ZSH_THEME_GIT_PROMPT_ADDED="%F{green}●"
ZSH_THEME_GIT_PROMPT_MODIFIED="%F{red}●"
ZSH_THEME_GIT_PROMPT_DELETED="%F{052}●"
ZSH_THEME_GIT_PROMPT_RENAMED="%F{130}●"
ZSH_THEME_GIT_PROMPT_UNMERGED="%F{red}✕"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%F{white}●"
