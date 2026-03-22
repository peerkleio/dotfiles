export PATH="/opt/homebrew/bin:/Users/peerallan/bin:/usr/local/bin:/usr/local/sbin:/opt/homebrew/opt/mysql-client/bin:/opt/homebrew/opt/llvm@14/bin:$PATH"

ZSH_THEME="powerlevel10k/powerlevel10k"

source "${HOME}/.config/zsh/macos-base.zsh"

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# Lazy-load version managers — defers eval cost until first use
if command -v rbenv >/dev/null 2>&1; then
  rbenv() { unfunction rbenv; eval "$(command rbenv init --no-rehash -)"; rbenv "$@" }
fi
if command -v nodenv >/dev/null 2>&1; then
  nodenv() { unfunction nodenv; eval "$(command nodenv init --no-rehash -)"; nodenv "$@" }
fi
if command -v pyenv >/dev/null 2>&1; then
  pyenv() { unfunction pyenv; eval "$(command pyenv init --no-rehash -)"; pyenv "$@" }
fi

if command -v dev >/dev/null 2>&1; then
  eval "$(dev _hook)"
fi

[[ -f "$HOME/.clio_profile" ]] && source "$HOME/.clio_profile"
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
