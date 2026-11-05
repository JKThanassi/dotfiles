# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew completions (brew itself is put on PATH by ~/.zprofile).
if (( $+commands[brew] )); then
  FPATH="${HOMEBREW_PREFIX:-$(brew --prefix)}/share/zsh/site-functions:$FPATH"
fi

# --- oh-my-zsh ---
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git npm node python macos zsh-autosuggestions zsh-syntax-highlighting)
source "$ZSH/oh-my-zsh.sh"

# --- User configuration ---

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

alias pwb="git rev-parse --abbrev-ref HEAD"
alias pwbcopy="git rev-parse --abbrev-ref HEAD | pbcopy"
alias linit="source venv/bin/activate; source .env"
alias ntdw="tmux new-window; tmux split-window -h; tmux split-window -v"
alias ctdw="tmux split-window -h; tmux split-window -v"
alias nukeNode="find . -name node_modules -type d -prune -exec rm -rf '{}' +"

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
export VIRTUAL_ENV_DISABLE_PROMPT=1
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
export GPG_TTY=$TTY

# vi mode
bindkey -v

# --- PATH ---
typeset -U path PATH   # drop duplicate entries
export BUN_INSTALL="$HOME/.bun"
path=("$BUN_INSTALL/bin" $path)
path+=("$HOME/.local/bin" "$HOME/.cargo/bin" "$HOME/.local/share/bob/nvim-bin")

# --- Tool hooks (each only if installed) ---

# Node via fnm: switches version on cd when a .nvmrc / .node-version is found.
if (( $+commands[fnm] )); then
  eval "$(fnm env --use-on-cd --version-file-strategy=recursive --corepack-enabled --shell zsh)"
fi

(( $+commands[direnv] )) && eval "$(direnv hook zsh)"

[[ -r "$HOME/.opam/opam-init/init.zsh" ]] && source "$HOME/.opam/opam-init/init.zsh" > /dev/null 2>&1

# Google Cloud SDK
if [[ -f "$HOME/Documents/google-cloud-sdk/path.zsh.inc" ]]; then
  source "$HOME/Documents/google-cloud-sdk/path.zsh.inc"
  source "$HOME/Documents/google-cloud-sdk/completion.zsh.inc"
fi

# --- Notability: BullMQ Pro npm token, read from 1Password only when needed ---
# Set BULLMQ_OP_REF (an op:// secret reference) in ~/.zshrc.local.
bullmq-token() {
  [[ -n $BULLMQ_PRO_NPM_TOKEN ]] && return 0
  if ! (( $+commands[op] )) || [[ -z $BULLMQ_OP_REF ]]; then
    print -u2 "bullmq-token: needs the 1Password CLI (op) and BULLMQ_OP_REF in ~/.zshrc.local"
    return 1
  fi
  local token
  token=$(op read --no-newline "$BULLMQ_OP_REF") || return 1
  export BULLMQ_PRO_NPM_TOKEN=$token
}

# True if a bunfig.toml / .npmrc in this dir or a parent references the token.
_bullmq_token_needed() {
  local dir=$PWD f
  while [[ $dir != / ]]; do
    for f in "$dir/bunfig.toml" "$dir/.npmrc"; do
      [[ -f $f ]] && grep -q BULLMQ_PRO_NPM_TOKEN "$f" && return 0
    done
    dir=${dir:h}
  done
  return 1
}

# Fetch the token the first time an install-type bun command runs where it's needed.
bun() {
  if [[ -z $BULLMQ_PRO_NPM_TOKEN && $1 == (install|i|add|a|update|outdated) ]] && _bullmq_token_needed; then
    bullmq-token || print -u2 "bun: continuing without BULLMQ_PRO_NPM_TOKEN"
  fi
  command bun "$@"
}

# Machine-specific settings and secrets (not tracked in git).
[[ -f "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# >>> open-knowledge cli >>>
# ! Contents within this block are managed by Open Knowledge. Do not edit.
# ! Delete this whole block to opt out — Open Knowledge will not re-add it.
[ -f "$HOME/.ok/env.sh" ] && . "$HOME/.ok/env.sh"
# <<< open-knowledge cli <<<
