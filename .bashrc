# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi
export PATH=${HOME}/usr/bin/:${PATH}
export PATH="$HOME/local/bin:$PATH"


# user modules
module load git
module load vim
module load valgrind
module load singularity

# intercept with zsh
#exec -l ${HOME}/local/bin/zsh
# set vim mode
# set editing-mode vi
set -o vi

# user PS1
RESET="\[\033[0m\]"
RED="\[\033[0;31m\]"
GREEN="\[\033[01;32m\]"
BLUE="\[\033[01;34m\]"
LIGHTBLUE="\[\033[01;94m\]"
LIGHTMAGENTA="\[\033[01;95m\]"
LIGHTCYAN="\[\033[01;96m\]"
YELLOW="\[\033[0;33m\]"

PS_LINE=`printf -- '- %.0s' {1..200}`
function parse_git_branch {
  PS_BRANCH=''
  PS_FILL=${PS_LINE:0:$COLUMNS}
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  PS_BRANCH="(git ${ref#refs/heads/}) "
}

PROMPT_COMMAND=parse_git_branch
PS_INFO="$LIGHTBLUE\u@\h$RESET:$LIGHTCYAN\w"
PS_GIT="$GREEN\$PS_BRANCH"
PS_TIME="\[\033[\$((COLUMNS-10))G\] $YELLOW[\t]"
export PS1="\${PS_FILL}\[\033[0G\]${PS_INFO} ${PS_GIT}${PS_TIME}\n${RESET} Campus Cluster > "
eval $( dircolors -b $HOME/scripts/LS_COLORS )

# user aliases
alias ls='ls --color=auto'
alias lt='ls -l -t'
alias ll='ls -l -h'
alias lla='ls -l -a'
