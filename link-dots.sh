#!/bin/bash
set -euo pipefail

DIR=~/dotfiles

ok() { printf "\033[1;32m    %s\033[0m\n" "$1"; }

link() {
  local src=$1 dest=$2
  mkdir -p "$(dirname "$dest")"
  if [[ -L "$dest" ]]; then
    rm "$dest"
  elif [[ -e "$dest" ]]; then
    mv "$dest" ~/dotfiles_old/
  fi
  ln -s "$src" "$dest"
  ok "$(basename "$dest")"
}

mkdir -p ~/dotfiles_old

# Dot-prefixed files in ~
for f in zshrc p10k.zsh tmux.conf tmux_theme gitconfig; do
  link "$DIR/$f" ~/."$f"
done

# Non-dot files in ~
link "$DIR/Brewfile" ~/Brewfile

# Config dirs
link "$DIR/init.lua"                   ~/.config/nvim/init.lua
link "$DIR/lua"                        ~/.config/nvim/lua
link "$DIR/bat_cfg"                    ~/.config/bat/config
link "$DIR/ghostty_config"             ~/.config/ghostty/config
link "$DIR/aerospace.toml"             ~/.config/aerospace/aerospace.toml
link "$DIR/lazygit/config.yml"         ~/Library/Application\ Support/lazygit/config.yml
