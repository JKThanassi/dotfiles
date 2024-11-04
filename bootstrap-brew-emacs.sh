$dir=~/dotfiles

#install brew packages
echo "installing brew packages\n"
brew bundle --file $dir/Brewfile

echo "installing nvim .0.9.5"
bob install 0.9.5
bob use 0.9.5

#put doom in the .emacs.d folder
#git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
#~/.emacs.d/bin/doom install

