#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                              # dotfiles directory
olddir=~/dotfiles_old                       # old dotfiles backup directory
files="zshrc p10k.zsh tmux.conf tmux_theme" # list of files/folders to symlink in homedir
nvim_cfg=~/.config/nvim                     # nvim config path
nvim_lua_cfg=~/.config/nvim/lua             # nvim lua config path
bat_cfg=~/.config/bat
zsh_custom=~/.oh-my-zsh/custom
doom_cfg=~/.doom.d
ghostty_cfg=~/.config/ghostty
aerospace_cfg=~/.config/aerospace

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
mkdir -p $ghostty_cfg
mkdir -p $aerospace_cfg

# change to the dotfiles directory
echo -n "Changing to the $dir directory ..."
cd $dir
echo "done"

# move my custom theme into the oh-my-zsh custom themes folder
echo "linking agnoster-jkt to $zsh_custom/themes"
mv $zsh_custom/themes/agnoster-jkt.zsh-theme $olddir/agnoster-jkt.zsh-theme
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
mv $nvim_cfg/init.vim $olddir/ 2>/dev/null || true
mv $nvim_cfg/init.lua $olddir/ 2>/dev/null || true
echo "Creating symlink to init.lua in $nvim_cfg"
ln -s $dir/init.lua $nvim_cfg/init.lua

# move old nvim lua config to dotfiles_old, then create symlink to the updated one
echo "moving nvim lua config to $olddir"
mv $nvim_lua_cfg $olddir/lua 2>/dev/null || true
echo "Creating symlink to lua directory in $nvim_cfg"
ln -s $dir/lua $nvim_cfg/lua

# move old coc-settings config to dotfiles_old, then create symlink to the updated one
echo "moving coc-settings config to $olddir"
mv $nvim_cfg/coc-settings.json $olddir/
echo "Creating symlink to coc-settings.json in $nvim_cfg"
ln -s $dir/coc-settings.json $nvim_cfg/coc-settings.json
#
# move old bat config to dotfiles_old, then create symlink to the updated one
echo "moving bat config to $olddir"
mv $bat_cfg/config $olddir/
echo "Creating symlink to bat_cfg in $bat_cfg"
ln -s $dir/bat_cfg $bat_cfg/config

# move old ghostty config to dotfiles_old, then create symlink to the updated one
echo "moving ghostty config to $olddir"
mv $ghostty_cfg/config $olddir/
echo "Creating symlink to ghostty_cfg in $ghostty_cfg"
ln -s $dir/ghostty_config $ghostty_cfg/config

# move old aerospace config to dotfiles_old, then create symlink to the updated one
echo "moving aerospace config to $olddir"
mv $aerospace_cfg/aerospace.toml $olddir/
echo "Creating symlink to aerospace.toml in $aerospace_cfg"
ln -s $dir/aerospace.toml $aerospace_cfg/aerospace.toml
