# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
# Add homebrew completion
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi
# Path to your oh-my-zsh installation.
export ZSH=/Users/$USER/.oh-my-zsh

#adding conda path
#source $HOME/anaconda3/bin/activate
#setting GOPATH
#export GOPATH=$HOME/go

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"
SOLARIZED_THEME=light

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails igit textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm node python tmux macos zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration
#source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias pwb="git rev-parse --abbrev-ref HEAD"
alias pwbcopy="git rev-parse --abbrev-ref HEAD | pbcopy"
alias linit="source venv/bin/activate; source .env"
alias ntdw="tmux new-window; tmux split-window -h; tmux split-window -v"
alias ctdw="tmux split-window -h; tmux split-window -v"
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zshe
#export PATH="/usr/local/opt/libxml2/bin:$PATH"

### NVM CONFIG
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
###


ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
export VIRTUAL_ENV_DISABLE_PROMPT=1

# this should hopefully allow for the installation of pillow
export CPATH=`xcrun --show-sdk-path`/usr/include

# Created by `userpath` on 2020-01-21 16:10:13
export PATH="$PATH:/Users/$USER/.local/bin"

# fzf config
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden'
#gpg config
export GPG_TTY=$(tty)
#pyenv init
eval "$(pyenv init --path)"
#eval "$(pyenv init -)"
#iterm2_shell_integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# vi mode
bindkey -v

[ -f "/Users/joekt/.ghcup/env" ] && source "/Users/$USER/.ghcup/env" # ghcup-env
# haskell language server sourcing>
PATH=$PATH:/Users/$USER/.local/bin
if [ -e /Users/joekt/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/joekt/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#path to google app creds
export GOOGLE_APPLICATION_CREDENTIALS=/Users/$USER/Documents/google_creds/dev_creds.json

# opam configuration
[[ ! -r /Users/joekt/.opam/opam-init/init.zsh ]] || source /Users/joekt/.opam/opam-init/init.zsh  > /dev/null 2> /dev/null

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/josephkaming-thanassi/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/josephkaming-thanassi/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/josephkaming-thanassi/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/josephkaming-thanassi/google-cloud-sdk/completion.zsh.inc'; fi
