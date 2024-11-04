#!/bin/sh
echo "This script will install zsh, oh-my-zsh, and some zsh plugins that I use."

if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

if test ! $(which zsh); then 
    echo "installing zsh"
    brew install zsh
    sudo chsh -s $(which zsh)
fi
# brew install zsh 
# echo "now changing shell to zsh"
# sudo chsh -s $(which zsh)

echo "installing oh my zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "now installing zsh-autosuggestions"
env -i git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "zsh-autosuggestions installed"

echo "installing zsh-syntax-highlighting"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
echo "installed zsh-syntax-highlighting"

echo "installing powerline10k theme"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
echo "finished installing theme"

echo "run ./bootstrap-brew-emacs.sh to install term apps"

