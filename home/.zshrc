ZSH=$HOME/.oh-my-zsh

# Environment variables
ZSH_THEME="gnzh" #"robbyrussell"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
# CASE_SENSITIVE="true"
# DISABLE_AUTO_UPDATE="true"
# export UPDATE_ZSH_DAYS=13
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"

setopt AUTO_PUSHD # cd does pushd
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails ruby git rvm virtualenv)

source $ZSH/oh-my-zsh.sh

alias wtf="git status"

commit_msg()    { curl whatthecommit.com 2>/dev/null | xmlstarlet sel -T -t -m '//div/p[1]' -v '.' }
excuse()        { curl programmerexcuses.com 2>/dev/null | grep -m 1 center | sed 's/<[^>]\+>//g;' }
gen_file_list() { find . -type f | sort | xargs sha1sum | tee file-list.txt }
# Enumerate processes in Disk Sleep ('D' in top)
ps_ds()         { top -b -n 1 | awk '{if (NR <=7) print; else if ($8 == "D") {print; count++} } END {print "Total status D: "count}' }

export GOPATH="$HOME/go"
export CSHEDIT="emacsclient -t"
export EDITOR="emacsclient -t"
export ALTERNATE_EDITOR=""
export PATH="$HOME/.local/bin/:/usr/local/go/bin/:$GOPATH/bin:/opt/google/chrome/:$PATH:/usr/local/bin:/usr/bin:/bin:/usr/games:$HOME/.rvm/bin"

[[ ! -d "$GOPATH" ]] && mkdir $GOPATH

# If we're not running in tmux, then set the terminal so that tmux can figure out we need color
# this is totally gnome-terminal's fault and I hate it for that.
if [ "$TERM" != "screen-256color" ]; then
    export TERM="xterm-256color"
fi

# Local preferences
[[ -f "$HOME/.zshrc-local" ]] && source "$HOME/.zshrc-local"
