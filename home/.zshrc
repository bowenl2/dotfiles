ZSH=$HOME/.oh-my-zsh

# Environment variables
ZSH_THEME="seeker"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails ruby git rvm)

source $ZSH/oh-my-zsh.sh

alias wtf="git status"
alias st="ssh testing"
alias sa="ssh alyssa"

export GOPATH="$HOME/go"
export CSHEDIT="emacsclient -t"
export EDITOR="emacsclient -t"
export ALTERNATE_EDITOR=""
export PATH="$GOPATH/bin:/opt/google/chrome/:$PATH:/usr/local/bin:/usr/bin:/bin:/usr/games:$HOME/.rvm/bin"

[[ ! -d "$GOPATH" ]] && mkdir $GOPATH

# If we're not running in tmux, then set the terminal so that tmux can figure out we need color
# this is totally gnome-terminal's fault and I hate it for that.
if [ "$TERM" != "screen-256color" ]; then
    export TERM="xterm-256color"
fi

[[ -f "$HOME/.zshrc-local" ]] && source "$HOME/.zshrc-local"
