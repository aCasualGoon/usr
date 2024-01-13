# source this file from your .bashrc
# [[ -f ~/.config/usr/.bashrc ]] && source ~/.config/usr/.bashrc
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# remove all previously set custom aliases
unalias -a

# ignore commands starting with space in history and don't store duplicates
export HISTCONTROL=ignoreboth:erasedups

# source this file using 'reconfig'
alias reconfig='source $SCRIPT_DIR/.bashrc'

# set prompt (show current directory and git branch)
PS1='\033[30;47m\w $(git branch 2> /dev/null | grep "^*" | sed "s/* /@/")◀\033[0m▶ '

# load aliases
source $SCRIPT_DIR/bash_aliases

# load functions
for file in $SCRIPT_DIR/bash_functions/*.sh; do
    source "$file"
done

echo e

# set git config
export GIT_CONFIG=$SCRIPT_DIR/.gitconfig