# Start zsh speed profiling
# zmodload zsh/zprof

# Check if ~/.zshrc is still a symlink to this file
if [ ! -L "$HOME/.zshrc" ] || [ "$(readlink $HOME/.zshrc)" != "$HOME/dotfiles/.zsh/.zshrc" ]; then
    echo "WARNING: '~/.zshrc' is not a symlink pointing to '~/dotfiles/.zsh/.zshrc!'"
    echo "Run the following command:"
    echo "rm ~/.zshrc && ln -s ~/dotfiles/.zsh/.zshrc ~/.zshrc"
fi

# BREW CONFIG: Allows access to Brew command and Brew packages
if [[ ! -f "$HOME/.brew_shellenv.zsh" ]] || [[ ! -s "$HOME/.brew_shellenv.zsh" ]]; then
  /opt/homebrew/bin/brew shellenv > "$HOME/.brew_shellenv.zsh"
fi
source "$HOME/.brew_shellenv.zsh"

# Cache brew --prefix for performance
BREW_PREFIX="$(brew --prefix)"



# START zsh-shift-select
# https://github.com/jirutka/zsh-shift-select
source ~/dotfiles/.zsh/plugins/zsh-shift-select/zsh-shift-select.plugin.zsh
# source ~/dotfiles/.zsh/plugins/zsh-shift-select-like-vscode/zsh-shift-select.plugin.zsh
# END zsh-shift-select

# START zsh-completions
# https://github.com/zsh-users/zsh-completions
# https://formulae.brew.sh/formula/zsh-completions#default
if type brew &>/dev/null; then
     FPATH=$BREW_PREFIX/share/zsh-completions:$FPATH
fi
# END zsh-completions

autoload -Uz compinit
if [ $(date +'%j') != $(/usr/bin/stat -f '%Sm' -t '%j' ~/.zcompdump 2>/dev/null) ]; then
  compinit
else
  compinit -C
fi


# START mouse support
# https://github.com/matschaffer/oh-my-zsh-custom/blob/master/mouse.zsh
source ~/dotfiles/.zsh/plugins/zsh-mouse-support/zsh-mouse-support.plugin.zsh
# END mouse support



### ZSH HOME
export ZSH=$HOME/dotfiles/.zsh

### ---- history config -------------------------------------
export HISTFILE=$ZSH/.zsh_history
# How many commands zsh will load to memory.
export HISTSIZE=10000
# How many commands history will save on file.
export SAVEHIST=10000

# History won't save duplicates.
setopt HIST_IGNORE_ALL_DUPS

# History won't show duplicates on search.
setopt HIST_FIND_NO_DUPS

export NVM_LAZY=1

# START PIP CONFIGURATION
# https://switowski.com/blog/disable-pip-outside-of-virtual-environments/#make-sure-that-pip-only-runs-in-a-virtual-environment
export PIP_REQUIRE_VIRTUALENV=true
# END PIP CONFIGURATION


# START docker
export PATH="$PATH:/Applications/Development Utils/Docker.app/Contents/Resources/bin/"
# END docker

# pnpm
export PNPM_HOME="/Users/theorib/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# pnpm node
PNPM_NODE_CURRENT="$HOME/Library/pnpm/nodejs_current"
if [ -L "$PNPM_NODE_CURRENT" ]; then
    export PATH="$PNPM_NODE_CURRENT/bin:$PATH"
fi
# pnpm node end

# START AWS CLI
export AWS_PROFILE=AWS
export AWS_DEFAULT_REGION=eu-west-2
# END AWS CLI

# START PATH CONFIGURATION
# Volta
# export VOLTA_HOME=$HOME/.volta
# export PATH="$VOLTA_HOME/bin:$PATH"
# export VOLTA_FEATURE_PNPM=1
# Local binaries
export PATH="$HOME/.local/bin:$PATH"
# PostgreSQL
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
# ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$(gem environment gemdir)/bin:$PATH"
# SQLite
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
# Java (for ios development)
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
# END PATH CONFIGURATION

# START Argyl CMS
export PATH=$PATH:/Applications/Argyll_V3.4.1/bin

# Go
export PATH=$PATH:$HOME/go/bin

# START starship
# https://starship.rs/
eval "$(starship init zsh)"
# END starship


# START UV and UVX completions
if [[ ! -f "$ZSH/.uv_completions.zsh" ]]; then
  uv generate-shell-completion zsh > "$ZSH/.uv_completions.zsh"
  uvx --generate-shell-completion zsh > "$ZSH/.uvx_completions.zsh"
fi
source "$ZSH/.uv_completions.zsh"
source "$ZSH/.uvx_completions.zsh"
# END UV completions

# START zsh autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
source $BREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Styling the syntax highlight
# https://scottspence.com/posts/my-updated-zsh-config-2025
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3,bold,underline"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3,standout"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# END zsh autosuggestions

# START zsh speed profiling
# zprof
# END zsh speed profiling

# START aliases

alias pn='pnpm'
alias pp='export PYTHONPATH=$(pwd) && echo "PYTHONPATH set to $(pwd)"'
alias vv='source venv/bin/activate && echo "venv activated"'
alias vvv='source .venv/bin/activate && echo ".venv activated"'

# useful aliases for replacing the ls command with the more powerful lsd command
# https://github.com/lsd-rs/lsd
alias ls="lsd -F"
alias la="lsd -AF"
alias ll="lsd -lAF"
alias lg="lsd -F --group-dirs=first"
alias lt="lsd -AF --tree"
alias tree="lsd --tree"
# END aliases

# START key bindings
bindkey "^[[A" up-line-or-history
bindkey "^[[B" down-line-or-history
bindkey "^[[C" forward-char
# bindkey "^E" history-beginning-search-forward-end
# END Key bindings# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/theorib/.docker/completions $fpath)
# End of Docker CLI completions




# remove aliases by running `pmg setup remove` or deleting the line 
[ -f /Users/theorib/.pmg.rc ] && source /Users/theorib/.pmg.rc  # PMG source aliases
