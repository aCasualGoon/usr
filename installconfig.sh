#! /bin/bash

# script to automatically set up ~/.bashrc etc. to point to ~/.config/usr/.bashrc etc.
# this will remove any previous configurations so make sure to safe those

if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root or with sudo."
    exit 1
fi

echo "Continuing will overwrite [~/.bashrc, ~/.bash_profile, ~/.bash_logout, /etc/pacman.conf] do you wish to continue?"
read -r -p "[Y/N] " response
# exit if not empty and no variation of yes (including partial)
if [[ ! -z "$response" && ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    echo "Aborting..."
    exit 1
fi

# get current user directory as first two directories of path (because running as root)
userdir=/home$(pwd | cut -d'/' -f1,3)

# link dotfiles
echo "source ~/.config/usr/.bashrc" > ~/.bashrc
echo "source ~/.config/usr/.bash_profile" > ~/.bash_profile
echo "~/.config/usr/.bash_logout" > ~/.bash_logout

# link pacman.conf (for current user directory)
echo "Include = $userdir/.config/usr/pacman.conf" > /etc/pacman.conf