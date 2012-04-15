# Colors
source ~/dotfiles/bash/colors.sh

# Some standard aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias l='ls -lah'

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

# Setting PATH
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

# Set Editor
export EDITOR="$vim"
export GIT_EDITOR="$vim"

# Make Bash append rather than overwrite the history on disk
# and don't put duplicate lines in the history
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoreboth
export HISTTIMEFORMAT='%F %T '

# Custom Bash prompt
git_prompt () {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then return 0; fi
  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')
  if git diff --quiet 2>/dev/null >&2; then git_status=""
  else git_status=" *"; fi
  echo "($git_branch$git_status)"
}

print_before_the_prompt () {
	printf "\n$txtred%s@%s:$bldgrn%s $txtwht$(git_prompt) \n$txtrst" "$USER" "$HOSTNAME" "$PWD"
}

PROMPT_COMMAND=print_before_the_prompt
PS1='--> '
