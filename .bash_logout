# call this file from your .bash_logout
# [[ -f ~/.config/usr/.bash_logout ]] && ~/.config/usr/.bash_logout

# commit & push all changes to git if git is installed
if command -v git >/dev/null 2>&1; then
    cd ~/.config/usr
    git add .
    git commit -m "auto commit"
    git push
fi