# allow aliases to be sudo'ed
alias sudo='sudo '

# -------- ls -------- #
alias ls='ls --color=auto'
alias ll='ls -lAF'
alias la='ls -A'

# -------- cp -------- #
alias cp='cp -r'

# -------- mv -------- #
alias mv='mv -r'

# -------- grep -------- #
alias grep='grep --color=auto'

# -------- rm -------- #
alias rmr='rm -r'
alias rmv='rm -rf'

# -------- cd -------- #
# if shell supports it, use ANSI escape codes to clear the line
if [[ "$-" == *i* && "$TERM" =~ xterm.*|rxvt.*|vt100|linux|screen.* ]]; then
    function cd   { builtin cd "$@" && echo -en "\033[A\033[K"; }
    function cd.  { [ "$#" -eq 0 ] && pwd          || { builtin cd  "$@" && echo -en "\033[A\033[K"; } }
    function cd.. { [ "$#" -eq 0 ] && builtin cd ..|| builtin cd ../"$@" && echo -en "\033[A\033[K"; }
    function cd~  { [ "$#" -eq 0 ] && builtin cd ~ || builtin cd  ~/"$@" && echo -en "\033[A\033[K"; }
    function cd/  { [ "$#" -eq 0 ] && builtin cd / || builtin cd   /"$@" && echo -en "\033[A\033[K"; }
    function cd-  { [ "$#" -eq 0 ] && builtin cd ~-|| builtin cd ~-/"$@" && echo -en "\033[A\033[K"; }
else
    function cd.  { [ "$#" -eq 0 ] && pwd  || cd    "$@"; }
    function cd.. { [ "$#" -eq 0 ] && cd ..|| cd ../"$@"; }
    function cd~  { [ "$#" -eq 0 ] && cd ~ || cd  ~/"$@"; }
    function cd/  { [ "$#" -eq 0 ] && cd / || cd   /"$@"; }
    function cd-  { [ "$#" -eq 0 ] && cd ~-|| cd ~-/"$@"; }
fi
alias ..='cd..'

# -------- cat -------- #
if command -v bat >/dev/null 2>&1; then
    alias cat='bat -P'
fi