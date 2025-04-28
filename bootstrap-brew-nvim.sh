$dir=~/dotfiles

#install brew packages
echo "installing brew packages\n"
brew bundle --file $dir/Brewfile

echo "installing nvim .0.9.5"
bob install 0.9.5
bob use 0.9.5


