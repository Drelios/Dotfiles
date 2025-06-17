# Mael's minimal custom Zsh theme (with Conda & Git support)

autoload -Uz colors && colors

# Symbols
local GIT_BRANCH_ICON="⎇"
local PROMPT_ARROW="❯"
local CONDA_ICON="🐍"

# Function to get current Git branch and status
git_prompt_info() {
  local branch dirty ahead behind
  local git_dir=$(git rev-parse --git-dir 2>/dev/null) || return

  branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  dirty=$(git status --porcelain 2>/dev/null | tail -n1)
  [[ -n "$dirty" ]] && dirty=" ✗" || dirty=""

  ahead=$(git rev-list --left-right --count @{upstream}...HEAD 2>/dev/null | awk '{print $1}')
  behind=$(git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null | awk '{print $2}')

  echo "%F{yellow}${GIT_BRANCH_ICON} ${branch}%f${dirty}"
}

# Conda env right prompt
conda_rprompt() {
  [[ -n "$CONDA_DEFAULT_ENV" ]] && echo "%F{cyan}${CONDA_ICON} [$CONDA_DEFAULT_ENV]%f"
}
# Left prompt (current dir + git info)
PROMPT='%F{blue}%~%f $(git_prompt_info)
%n%F{green}'${PROMPT_ARROW}'%f '

# Seuil en secondes (tu peux ajuster)
typeset -g CMD_TIMER_THRESHOLD=2

# Variable globale pour le temps
typeset -g LAST_CMD_DURATION=0

# Hook pré-exécution : start timer
preexec() {
  timer=${EPOCHREALTIME}
}

# Hook post-exécution : calcule durée
precmd() {
  if [[ -n "$timer" ]]; then
    local now=${EPOCHREALTIME}
    LAST_CMD_DURATION=$(printf "%.0f" "$(echo "($now - $timer)" | bc -l)")
    unset timer
  fi
}

# Fonction d’affichage du timer
function timer_prompt() {
  if (( LAST_CMD_DURATION >= CMD_TIMER_THRESHOLD )); then
    echo "%F{magenta}⏱ ${LAST_CMD_DURATION}s%f "
  fi
}

# RPROMPT avec timer puis conda env
RPROMPT='$(timer_prompt) ${CONDA_DEFAULT_ENV:+[$CONDA_DEFAULT_ENV]}🐍'

