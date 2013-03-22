# BSD style coloring for ls
alias ls="ls -G"

# Setting PATH
PATH="/usr/local/bin:/usr/local/sbin:${PATH}"
export PATH

# Set max open files higher to make duply work correctly
ulimit -n 1024

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
