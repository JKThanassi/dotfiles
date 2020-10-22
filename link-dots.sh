#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="vimrc zshrc tmux.conf tmux_theme"  # list of files/folders to symlink in homedir
emacs_files="init.el config.el packages.el" # list of doom config files to simlink in the doom cfg folder
nvim_cfg=~/.config/nvim           # nvim config path
bat_cfg=~/.config/bat
zsh_custom=~/.oh-my-zsh/custom
doom_cfg=~/.doom.d
doom_exec_loc=~/.emacs.d/bin

##########

# create dotfiles_old in homedir
echo -n "Creating $olddir for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "done"

# create dirs for other stuff if needed
echo "creating dirs for nvim, bat, and doom configs if necessary"
mkdir -p $nvim_cfg
mkdir -p $bat_cfg
mkdir -p $doom_cfg


# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move my custom theme into the oh-my-zsh custom themes folder
echo "linking agnoster-jkt to $zsh_custom/themes"
mv $zsh_custom/themes/agnoster-jkt.zsh-theme $olddir/agnoster-jkt.zsh-theme
ln -s $dir/agnoster-jkt.zsh-theme $zsh_custom/themes/agnoster-jkt.zsh-theme 
echo "done"

# move my doom config in to the .doom.d folder
for file in $emacs_files; do
    echo "Moving any existing emacs dotfiles from $doom_cfg to $olddir/emacs"
    mv $doom_cfg/$file ~/dotfiles_old/emacs
    echo "Creating symlink to $file in $doom_cfg directory."
    ln -s $dir/emacs_conf/$file $doom_cfg/$file
done


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

echo ""
echo "Running doom sync"
cd $doom_exec_loc
./doom sync
"restart emacs  for changes to take effect"
