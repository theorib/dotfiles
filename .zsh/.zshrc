# Start zsh speed profiling
# zmodload zsh/zprof

# BREW CONFIG: Allows access to Brew command and Brew packages
eval $(/opt/homebrew/bin/brew shellenv)




# START zsh-shift-select
# https://github.com/jirutka/zsh-shift-select
source ~/dotfiles/.zsh/plugins/zsh-shift-select/zsh-shift-select.plugin.zsh
# source ~/dotfiles/.zsh/plugins/zsh-shift-select-like-vscode/zsh-shift-select.plugin.zsh
# END zsh-shift-select

# START zsh-completions
# https://github.com/zsh-users/zsh-completions
# https://formulae.brew.sh/formula/zsh-completions#default
if type brew &>/dev/null; then
     FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

     autoload -Uz compinit
     compinit
    fi
# END zsh-completions


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

# START PYENV CONFIGURATION
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# END PYENV CONFIGURATION

# START PATH CONFIGURATION
# Volta
export VOLTA_HOME=$HOME/.volta
export PATH="$VOLTA_HOME/bin:$PATH"
export VOLTA_FEATURE_PNPM=1
# Local binaries
export PATH="$HOME/.local/bin:$PATH"
# PostgreSQL
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
# ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$(gem environment gemdir)/bin:$PATH"
# Java
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
# SQLite
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"

# END PATH CONFIGURATION

# START starship
# https://starship.rs/
eval "$(starship init zsh)"
# END starship


# START UV and UVX completions
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"
# END UV completions

#START poetry completions
fpath+=~/dotfiles/.zsh/.zfunc
autoload -Uz compinit && compinit
# END poetry completions

# START zsh autosuggestions
# https://github.com/zsh-users/zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Styling the syntax highlight
# https://scottspence.com/posts/my-updated-zsh-config-2025
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3,bold,underline"
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=3,standout"
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE="20"
ZSH_AUTOSUGGEST_USE_ASYNC=1
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
# END zsh autosuggestions

# START zsh-syntax-highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting/tree/master?tab=readme-ov-file
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# END zsh-syntax-highlighting

# START zsh speed profiling
# zprof
# END zsh speed profiling

# START aliases
alias pn='pnpm'
alias pp='export PYTHONPATH=$(pwd) && echo "PYTHONPATH set to $(pwd)"'
alias vv='source venv/bin/activate && echo "venv activated"'
alias vvv='source .venv/bin/activate && echo ".venv activated"'
# END aliases

# START key bindings
bindkey "^[[A" up-line-or-history
bindkey "^[[B" down-line-or-history
bindkey "^[[C" forward-char
# bindkey "^E" history-beginning-search-forward-end
# END Key bindings