
# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
source ~/completion-for-pnpm.bash

# START starship
eval "$(starship init bash)"
# END starship

# START volta
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
# END volta

# START aliases
alias pn='pnpm'
alias pp='export PYTHONPATH=$(pwd) && echo "PYTHONPATH set to $(pwd)"'
alias vv='source venv/bin/activate && echo "venv activated"'
alias vvv='source .venv/bin/activate && echo ".venv activated"'
# END aliases