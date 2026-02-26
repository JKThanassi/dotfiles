$dir=~/dotfiles

#install brew packages
echo "installing brew packages\n"
brew bundle --file $dir/Brewfile

echo "installing nvim .0.9.5"
bob install 0.11.3
bob use 0.11.3

# install python
uv python install --default
