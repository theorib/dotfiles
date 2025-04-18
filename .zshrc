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

# run sqlite from homebrew
export PATH="/opt/homebrew/opt/sqlite/bin:$PATH"
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"

# ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH="$(gem environment gemdir)/bin:$PATH"



# BREW CONFIG: Allows access to Brew command and Brew packages
eval $(/opt/homebrew/bin/brew shellenv)

# START PYENV CONFIGURATION
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
# END PYENV CONFIGURATION

# START PSQL CONFIGURATION
export PATH="/opt/homebrew/opt/postgresql@17/bin:/Users/theorib/.pyenv/shims:/Users/theorib/.npm/_npx/242bb6866408f4ac/node_modules/.bin:/Users/theorib/node_modules/.bin:/Users/node_modules/.bin:/node_modules/.bin:/Users/theorib/.nvm/versions/node/v23.9.0/lib/node_modules/npm/node_modules/@npmcli/run-script/lib/node-gyp-bin:/opt/homebrew/lib/ruby/gems/3.4.0/bin:/opt/homebrew/opt/ruby/bin:/opt/homebrew/opt/openjdk@11/bin:/opt/homebrew/opt/sqlite/bin:/Users/theorib/.nvm/versions/node/v23.9.0/bin:/opt/homebrew/lib/ruby/gems/3.4.0/bin:/opt/homebrew/opt/ruby/bin:/opt/homebrew/opt/openjdk@11/bin:/opt/homebrew/opt/sqlite/bin:/Users/theorib/.local/bin:/Users/theorib/.volta/bin:/Library/Frameworks/Python.framework/Versions/3.11/bin:/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/System/Cryptexes/App/usr/bin:/usr/bin:/bin:/usr/sbin:/sbin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/local/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/bin:/var/run/com.apple.security.cryptexd/codex.system/bootstrap/usr/appleinternal/bin:/Library/Apple/usr/bin"

# END PSQL CONFIGURATION




# END zsh speed profiling
# zprof