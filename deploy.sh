#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
#files="bashrc vimrc vim zshrc oh-my-zsh"    # list of files/folders to symlink in homedir
files="bash_profile bashrc screenrc tmux.conf vim vimrc"

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $olddir"
	mv ~/.$file ~/dotfiles_old/
	echo "Creating symlink to $file in home directory."
	ln -s $dir/$file ~/.$file
done

# detect platform
platform='unknown'
unamestr=`uname`
if [[ "$unamestr" == 'Linux' ]]; then platform='linux'
elif [[ "$unamestr" == 'Darwin' ]]; then platform='mac'
elif [[ "$unamestr" == 'FreeBSD' ]]; then platform='freebsd'
fi

# if on a Mac, set system defaults
if [[ $platform == 'mac' ]]; then
	#echo "Setting Mac system defaults"
  #sh $dir/set-osx-defaults.sh
fi

echo "reloading .bashrc"
source ~/.bashrc
