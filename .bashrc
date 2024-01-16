# source this file from your .bashrc
# [[ -f ~/.config/usr/.bashrc ]] && source ~/.config/usr/.bashrc

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# function to source a file if it exists
function sourceif { [[ -f $1 ]] && source $1; }

# remove all previously set custom aliases
unalias -a

function install_default_packages {
    [ -f $SCRIPT_DIR/default_packages ] && sudo pacman -Syu --needed $(cat $SCRIPT_DIR/default_packages)
    [ -f $SCRIPT_DIR/local/default_packages ] && sudo pacman -Syu --needed $(cat $SCRIPT_DIR/local/default_packages)
}

# source this file using 'reconfig'
alias reconfig='source $SCRIPT_DIR/.bashrc'

# ignore commands starting with space in history and don't store duplicates
export HISTCONTROL=ignoreboth:erasedups

# set prompt (show current directory and git branch)
PS1='\033[30;47m\w $(git branch 2> /dev/null | grep "^*" | sed "s/* /@/")◀\033[0m▶ '

# load environment variables
sourceif $SCRIPT_DIR/bash_env
sourceif $SCRIPT_DIR/local/bash_env

# load aliases
sourceif $SCRIPT_DIR/bash_aliases
sourceif $SCRIPT_DIR/local/bash_aliases

# load functions
for file in $SCRIPT_DIR/bash_functions/*.sh; do
    sourceif "$file"
done

# suggest package if command not found using pkgfile (if installed)
if command -v pkgfile >/dev/null 2>&1; then
    command_not_found_handle() {
        local cmd=$1
        local pkg=$(pkgfile --bin $cmd)

        if [[ -n $pkg ]]; then
            echo "Command '$cmd' not found, you can install it with:"
            echo "  sudo pacman -S $pkg"
        else
            echo "Command '$cmd' not found."
        fi
    }
fi


# set git config
export GIT_CONFIG=$SCRIPT_DIR/.gitconfig

# source the local .bashrc if it exists
sourceif $SCRIPT_DIR/local/.bashrc

# unsource helper
unset -f sourceif