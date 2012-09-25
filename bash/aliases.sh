# Some standard aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -lah'
alias b='cd ../'
alias bb='cd ../../'
alias bbb='cd ../../../'
alias bbbb='cd ../../../../'

# Git aliases
alias gcl='git clone'
alias gs='git status'
alias gss='git status -s'
alias gco='git checkout'
alias gl='git log --oneline'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gpo='git push origin'
alias gb='git branch'
alias gh='git help '
alias ga='git add'
alias gall='git add .'
alias gcm='git commit -m'
alias gcam='git commit -am'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias cdiff='git diff --cached'
alias gsdiff='git diff --staged'

# other aliases
alias ta='tmux attach'
alias lastfm='shell-fm lastfm://'
alias reload='source ~/.bashrc'

# aptitude aliases
alias sau='sudo aptitude update'
alias sas='sudo aptitude search '
alias sai='sudo aptitude install '
#alias sar='sudo aptitude -P remove '
alias sasu='sudo aptitude -P safe-upgrade'

# todo.txt aliases
alias t=todo
alias tl='todo list'
alias ta='todo add'
