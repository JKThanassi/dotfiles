# My dotfiles

### installation instructions

1. On a new machine, run `bootstrap.sh`. This will:
    - Install Homebrew, zsh, and set zsh as the default shell
    - Install Oh My Zsh plus the plugins/theme used in `.zshrc` (zsh-autosuggestions, zsh-syntax-highlighting, powerlevel10k)
    - Install everything in the `Brewfile`
    - Install Neovim stable via `bob`
    - Symlink the dotfiles into place by invoking `link-dots.sh`
    - Install Python via `uv` and Node LTS via `nvm`
2. If you only need to (re)create symlinks on an already-bootstrapped machine, run `link-dots.sh` directly. It backs up any existing non-symlink targets to `~/dotfiles_old/` before linking.
