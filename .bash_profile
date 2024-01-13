# source this file from your .bash_profile
# [[ -f ~/.config/usr/.bash_profile ]] && source ~/.config/usr/.bash_profile
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# source the bashrc file
source $SCRIPT_DIR/.bashrc

# pull the latest changes from git if git is installed
if command -v git >/dev/null 2>&1; then
    cd $SCRIPT_DIR
    git pull
    cd ~-
fi