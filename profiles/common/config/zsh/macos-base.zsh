# Shared macOS config — sourced by profile macosx.zsh files
# NOT placed in oh-my-zsh/custom/ to avoid double-loading

# Editor
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

# Go
export GOPATH="$HOME/src/go"
export PATH="$PATH:${GOPATH}/bin"

# Homebrew
if [[ $- == *i* ]]; then
  if command -v brew >/dev/null 2>&1; then
    eval "$('/opt/homebrew/bin/brew' shellenv)"
  fi
fi

# p10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# iTerm2/Cursor integration
if [[ -n $CURSOR_TRACE_ID ]]; then
  PROMPT_EOL_MARK=""
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
  precmd() { print -Pn "\e]133;D;%?\a" }
  preexec() { print -Pn "\e]133;C;\a" }
fi
