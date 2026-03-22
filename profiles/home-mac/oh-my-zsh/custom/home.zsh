# home-mac-specific zsh additions — loaded automatically by Oh My Zsh

# Docker completions (portable path)
[[ -d "$HOME/.docker/completions" ]] && fpath=($HOME/.docker/completions $fpath)

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Secrets
[[ -f "$HOME/.zsh_secrets" ]] && source "$HOME/.zsh_secrets"
