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

setopt AUTO_PUSHD # cd does pushd
setopt PUSHD_SILENT
setopt PUSHD_TO_HOME

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(rails ruby git rvm virtualenv)

source $ZSH/oh-my-zsh.sh

alias wtf="git status"
alias st="ssh testing"
alias sa="ssh alyssa"

commit_msg()    { curl whatthecommit.com 2>/dev/null | xmlstarlet sel -T -t -m '//div/p[1]' -v '.' }
excuse()        { curl programmerexcuses.com 2>/dev/null | grep -m 1 center | sed 's/<[^>]\+>//g;' }
gen_file_list() { find . -type f | sort | xargs sha1sum | tee file-list.txt }
jira()          { google-chrome "https://jira.amicillc.com/browse/$1" }
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

# A shortcut function that simplifies usage of xclip.
# - Accepts input from either stdin (pipe), or params.
# ------------------------------------------------
cb() {
  local _scs_col="\e[0;32m"; local _wrn_col='\e[1;31m'; local _trn_col='\e[0;33m'
  # Check that xclip is installed.
  if ! type xclip > /dev/null 2>&1; then
    echo -e "$_wrn_col""You must have the 'xclip' program installed.\e[0m"
  # Check user is not root (root doesn't have access to user xorg server)
  elif [[ "$USER" == "root" ]]; then
    echo -e "$_wrn_col""Must be regular user (not root) to copy a file to the clipboard.\e[0m"
  else
    # If no tty, data should be available on stdin
    if ! [[ "$( tty )" == /dev/* ]]; then
      input="$(< /dev/stdin)"
    # Else, fetch input from params
    else
      input="$*"
    fi
    if [ -z "$input" ]; then  # If no input, print usage message.
      echo "Copies a string to the clipboard."
      echo "Usage: cb <string>"
      echo "       echo <string> | cb"
    else
      # Copy input to clipboard
      echo -n "$input" | xclip -selection c
      # Truncate text for status
      if [ ${#input} -gt 80 ]; then input="$(echo $input | cut -c1-80)$_trn_col...\e[0m"; fi
      # Print status.
      echo -e "$_scs_col""Copied to clipboard:\e[0m $input"
    fi
  fi
}
# Aliases / functions leveraging the cb() function
# ------------------------------------------------
# Copy contents of a file
function cbf() { cat "$1" | cb; }
# Copy SSH public key
alias cbssh="cbf ~/.ssh/id_rsa.pub"
# Copy current working directory
alias cbwd="pwd | cb"
# Copy most recent command in bash history
alias cbhs="cat $HISTFILE | tail -n 1 | cb"

# Local preferences
[[ -f "$HOME/.zshrc-local" ]] && source "$HOME/.zshrc-local"
