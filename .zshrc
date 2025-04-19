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


# END zsh speed profiling
# zprof