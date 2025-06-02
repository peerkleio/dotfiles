export PATH="/opt/homebrew/bin:/Users/peerallan/bin:/usr/local/bin:/usr/local/sbin:/opt/homebrew/opt/mysql-client/bin:/opt/homebrew/opt/llvm@14/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR="code -w"
fi
export GIT_EDITOR=$EDITOR

# Compilation flags
export ARCHFLAGS="-arch arm64"
export RUBY_CONFIGURE_OPTS="--enable-yjit"

export CPPFLAGS="-I/opt/homebrew/opt/llvm@14/include"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Homebrew
if command -v brew >/dev/null 2>&1; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi
# rbenv
if command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init --no-rehash -)"
fi
# nodenv
if command -v nodenv >/dev/null 2>&1; then
  eval "$(nodenv init --no-rehash -)"
fi
# pyenv
if command -v pyenv >/dev/null 2>&1; then
  eval "$(pyenv init --no-rehash -)"
fi

if command -v dev >/dev/null 2>&1; then
  eval "$(dev _hook)"
fi

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/peerallan/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

# ---
# macOS-specific environment setup
# Source Clio and Rust environment if present
# These were previously in .bash_profile/.profile and are needed for dev tools
if [ -f "$HOME/.clio_profile" ]; then
  source "$HOME/.clio_profile"
fi

if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi
