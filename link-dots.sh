#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc zshrc tmux.conf tmux_theme"  # list of files/folders to symlink in homedir
nvim_cfg=~/.config/nvim           # nvim config path
bat_cfg=~/.config/bat
zsh_custom=~/.oh-my-zsh/custom

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move my custom theme into the oh-my-zsh custom themes folder
echo "linking agnoster-jkt to $zsh_custom/themes"
ln -s $dir/agnoster-jkt.zsh-theme $zsh_custom/themes/agnoster-jkt.zsh-theme 
echo "done"


# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

# move old nvim config to dotfiles_old, then create symlink to the updated one
echo "moving nvim config to $olddir"
mv $nvim_cfg/init.vim $olddir/
echo "Creating symlink to init.vim in $nvim_cfg"
ln -s $dir/init.vim $nvim_cfg/init.vim

# move old bat config to dotfiles_old, then create symlink to the updated one
echo "moving nvim config to $olddir"
mv $bat_cfg/config $olddir/
echo "Creating symlink to bat_cfg in $bat_cfg"
ln -s $dir/bat_cfg $bat_cfg/config

