# Start zsh speed profiling
# zmodload zsh/zprof

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export NVM_LAZY=1

# Oh My ZSH Plugins
plugins=(
  # autopep8
  # aws
  pip
  # https://github.com/nvbn/thefuck
  thefuck
  # Activate Starship
  starship

  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gitignore
  gitignore

  # https://aronschueler.de/blog/2021/12/10/fix-slow-zsh-startup-nvm/
  nvm

  # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/git
  # git

  # https://github.com/zsh-users/zsh-syntax-highlighting/tree/master
  zsh-syntax-highlighting

  # https://github.com/zsh-users/zsh-autosuggestions
  zsh-autosuggestions
  
  zsh-shift-select
)

# START zsh-completions
# https://github.com/zsh-users/zsh-completions
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit
# END zsh-completions

source "$ZSH/oh-my-zsh.sh"


# START aliases
alias pn='pnpm'
# END aliases


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"



export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

# ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$(gem environment gemdir)/bin:$PATH"



# BREW CONFIG: Allows access to Brew command and Brew packages
eval $(/opt/homebrew/bin/brew shellenv)

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
# PostgreSQL
export PATH="/opt/homebrew/opt/postgresql@17/bin:$PATH"
# Python (pyenv)
export PATH="$HOME/.pyenv/shims:$PATH"
# Node.js related paths
export PATH="$HOME/.npm/_npx/242bb6866408f4ac/node_modules/.bin:$PATH"
export PATH="$HOME/node_modules/.bin:$PATH"
# export PATH="/Users/node_modules/.bin:$PATH"
# export PATH="/node_modules/.bin:$PATH"
export PATH="$HOME/.nvm/versions/node/v23.9.0/lib/node_modules/npm/node_modules/@npmcli/run-script/lib/node-gyp-bin:$PATH"
export PATH="$HOME/.nvm/versions/node/v23.9.0/bin:$PATH"
# Ruby
export PATH="/opt/homebrew/lib/ruby/gems/3.4.0/bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
# Java
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)
# SQLite
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
# Local binaries
export PATH="$HOME/.local/bin:$PATH"
# Python framework
export PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:$PATH"
# Homebrew
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"
# System paths
export PATH="/usr/local/bin:$PATH"
export PATH="/System/Cryptexes/App/usr/bin:$PATH"
export PATH="/usr/bin:$PATH"
export PATH="/bin:$PATH"
export PATH="/usr/sbin:$PATH"
export PATH="/sbin:$PATH"
# Apple security paths
export PATH="/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:$PATH"
export PATH="/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:$PATH"
export PATH="/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:$PATH"
export PATH="/Library/Apple/usr/bin:$PATH"
# END PATH CONFIGURATION


# END zsh speed profiling
# zprof