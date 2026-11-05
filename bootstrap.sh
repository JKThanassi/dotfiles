#!/bin/bash
set -euo pipefail

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

info() { printf "\n\033[1;34m==> %s\033[0m\n" "$1"; }
ok()   { printf "\033[1;32m    %s\033[0m\n" "$1"; }

# --- Homebrew ---
info "Homebrew"
if command -v brew &>/dev/null; then
  ok "already installed"
else
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add brew to PATH for the rest of this script (Apple Silicon vs Intel)
  if [[ -f /opt/homebrew/bin/brew ]]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
  elif [[ -f /usr/local/bin/brew ]]; then
    eval "$(/usr/local/bin/brew shellenv)"
  fi
fi

# --- Zsh ---
info "Zsh"
if command -v zsh &>/dev/null; then
  ok "already installed"
else
  brew install zsh
fi
if [[ "$SHELL" != *zsh ]]; then
  info "Setting zsh as default shell"
  sudo chsh -s "$(which zsh)" "$USER"
else
  ok "already default shell"
fi

# --- Oh My Zsh + plugins ---
info "Oh My Zsh"
if [[ -d ~/.oh-my-zsh ]]; then
  ok "already installed"
else
  RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

clone_if_missing() {
  local repo=$1 dest=$2
  if [[ -d "$dest" ]]; then
    ok "$(basename "$dest") already installed"
  else
    git clone --depth=1 "$repo" "$dest"
  fi
}

info "Zsh plugins & theme"
clone_if_missing https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
clone_if_missing https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
clone_if_missing https://github.com/romkatv/powerlevel10k "$ZSH_CUSTOM/themes/powerlevel10k"

# --- Brewfile ---
info "Brew bundle"
brew bundle --file "$DIR/Brewfile"

# --- Neovim via bob ---
info "Neovim (via bob)"
if command -v bob &>/dev/null; then
  bob install stable
  bob use stable
  ok "nvim stable installed"
else
  echo "bob not found — should have been installed via Brewfile"
  exit 1
fi

# --- Link dotfiles ---
info "Linking dotfiles"
"$DIR/link-dots.sh"

# --- Python via uv ---
info "Python (via uv)"
if command -v uv &>/dev/null; then
  uv python install --default
  ok "done"
else
  echo "uv not found — should have been installed via Brewfile"
  exit 1
fi

# --- Node via fnm ---
info "Node LTS (via fnm)"
if command -v fnm &>/dev/null; then
  eval "$(fnm env --shell bash)"
  fnm install --lts
  fnm default lts-latest
  fnm exec --using=default corepack enable
  ok "Node $(fnm exec --using=default node --version) installed"
else
  echo "fnm not found — should have been installed via Brewfile"
  exit 1
fi

info "All done!"
