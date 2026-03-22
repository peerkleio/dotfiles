export PATH="/opt/homebrew/bin:/Users/pallan/bin:/usr/local/bin:/usr/local/sbin:/opt/homebrew/opt/mysql-client/bin:/opt/homebrew/opt/llvm@14/bin:$PATH"

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

export GOPATH="$HOME/src/go"
export PATH="$PATH:${GOPATH}/bin"

export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# Homebrew
if [[ $- == *i* ]]; then
  if command -v brew >/dev/null 2>&1; then
    eval "$('/opt/homebrew/bin/brew' shellenv)"
  fi
fi

if [[ -n $CURSOR_TRACE_ID ]]; then
  PROMPT_EOL_MARK=""
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
  precmd() { print -Pn "\e]133;D;%?\a" }
  preexec() { print -Pn "\e]133;C;\a" }
fi
