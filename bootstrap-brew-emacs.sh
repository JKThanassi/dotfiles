$dir=~/dotfiles

#install brew packages
echo "installing brew packages\n"
brew bundle --file $dir/Brewfile

#put doom in the .emacs.d folder
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
~/.emacs.d/bin/doom install

