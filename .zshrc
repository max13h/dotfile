export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting git-flow github poetry ssh ssh-agent sudo )
source $ZSH/oh-my-zsh.sh

export EDITOR='vim'

# Sources
source ~/.aliases
source ~/.scripts/unistra

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Atuin
eval "$(atuin init zsh)"

# Apparmor 
APPARMOR_MARKER="/tmp/.apparmor_started"
if [ ! -f "$APPARMOR_MARKER" ]; then
    echo "Run apparmor:"
    if sudo systemctl start apparmor 2>/dev/null; then
        touch "$APPARMOR_MARKER"
    fi
fi
