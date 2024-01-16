#! /bin/bash

# script to automatically set up ~/.bashrc etc. to point to ~/.config/usr/.bashrc etc.
# this will remove any previous configurations so make sure to safe those

echo "Continuing will overwrite [~/.bashrc, ~/.bash_profile, ~/.bash_logout] do you wish to continue?"
read -r -p "[Y/N] " response
# exit if not empty and no variation of yes (including partial)
if [[ ! -z "$response" && ! "$response" =~ ^([yY][eE][sS]|[yY])$ ]]; then
    exit 1
fi

# link dotfiles
echo "source ~/.config/usr/.bashrc" > ~/.bashrc
echo "source ~/.config/usr/.bash_profile" > ~/.bash_profile
echo "~/.config/usr/.bash_logout" > ~/.bash_logout