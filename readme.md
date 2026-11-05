# My dotfiles

### installation instructions

1. On a new machine, run `bootstrap.sh`. This will:
    - Install Homebrew, zsh, and set zsh as the default shell
    - Install Oh My Zsh plus the plugins/theme used in `.zshrc` (zsh-autosuggestions, zsh-syntax-highlighting, powerlevel10k)
    - Install everything in the `Brewfile`
    - Install Neovim stable via `bob`
    - Symlink the dotfiles into place by invoking `link-dots.sh`
    - Install Python via `uv` and Node LTS via `fnm`
2. If you only need to (re)create symlinks on an already-bootstrapped machine, run `link-dots.sh` directly. It backs up any existing non-symlink targets to `~/dotfiles_old/` before linking.

### Machine-specific settings

`~/.zshrc.local` is sourced at the end of `.zshrc` and is not tracked. Put per-machine settings there, e.g. the 1Password reference for the Notability BullMQ token:

```zsh
export BULLMQ_OP_REF='op://<vault>/<item>/<field>'
```

`bun install` in a repo whose `bunfig.toml`/`.npmrc` uses `BULLMQ_PRO_NPM_TOKEN` fetches it via `op` on first use; run `bullmq-token` to load it manually (needed before scripts like `install_dev.sh`).
