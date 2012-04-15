# Colors
source ~/dotfiles/bash/colors.sh

# Aliases
source ~/dotfiles/bash/aliases.sh

# bash prompt
source ~/dotfiles/bash/prompt.sh

# Set Editor
export EDITOR="$vim"
export GIT_EDITOR="$vim"

# Make Bash append rather than overwrite the history on disk
# and don't put duplicate lines in the history
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoreboth
export HISTTIMEFORMAT='%F %T '

# detect platform and load platform specific bash config
unamestr=`uname`
if [[ "$unamestr" == 'Darwin' ]]; then source ~/dotfiles/bash/osx.sh
else source ~/dotfiles/bash/linux.sh
fi
