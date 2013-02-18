# Colors
source ~/dotfiles/bash/colors.sh

# Aliases
source ~/dotfiles/bash/aliases.sh

# bash prompt
source ~/dotfiles/bash/prompt.sh

# Set Editor
export EDITOR=vim
export GIT_EDITOR=vim

# Make Bash append rather than overwrite the history on disk
# and don't put duplicate lines in the history
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoreboth
export HISTTIMEFORMAT='%F %T '

# detect platform and load platform specific bash config
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then
  source ~/dotfiles/bash/osx.sh
  #source "`brew --prefix grc`/etc/grc.bashrc"
else 
  source ~/dotfiles/bash/linux.sh
fi

export PATH="$HOME/bin:/usr/bin/local:/usr/local/heroku/bin:$PATH"

# Set gems path
export GEM_HOME="$HOME/.gem"
export GEM_PATH="$HOME/.gem"
