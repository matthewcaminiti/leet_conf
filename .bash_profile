# ~/.bashrc: executed by bash(1) for non-login shells.

# tell terminal to stop zsh harassment
export BASH_SILENCE_DEPRECATION_WARNING=1

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# [a]ppend to shared history
# this is executed before every prompt, good for shared history with tmux
export PROMPT_COMMAND="history -a"

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000
HISTFILESIZE=20000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

##################### ALIASES
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
##################### FUNCTIONS
function dlf() {
    containerId=$(docker container ls --format "table {{.Names}}\t{{.ID}}" | grep $1 | awk '{print $1}')

    if [[ -z "$containerId" ]]; then
        echo "Couldn't find container matching: \"$1\""
    else
        docker logs -f "$containerId"
    fi
}

function dcl() {
    res=`docker container ls --format "table {{.Names}}\t{{.ID}}\t{{.Status}}\t{{.Ports}}"`
    IFS=$'\n' # splits on \n
    resArr=($res)

    if [[ -n "$1" ]]; then
        docker logs -f $(echo ${resArr[$(($1 + 1))]} | awk '{ print $1 }')
        return 0
    fi

    len=$(printf "$res" | wc -l)

    for (( i=0; i<=$len; i++ )); do
        if [[ $i -gt 0 ]]; then
            shiftedIdx=$(($i - 1))
            [ $i -lt 11 ] && s=" " || s=""
            echo -e "$s[$shiftedIdx]: ${resArr[$i]}"
        else
            echo -e "      ${resArr[$i]}"
        fi
    done
}

function gr() {
    len=7

    if [[ -n "$1" ]]; then
        [ ${1:0:1} == "+" ] && len=${1:1:10} || len=$(($1 + 1))
    fi

    branches=`git reflog | egrep -io "moving from ([^[:space:]]+)" | awk '{ print $3 }' | awk ' !x[$0]++' | egrep -v '^[a-f0-9]{40}$' | head -n$len`
    branchArr=($branches)

    if [[ -z "$1" || ${1:0:1} == "+" ]]; then
        for (( i=0; i<$len; i++ )); do
            echo "[$i]: ${branchArr[$i]}"
        done
    else
        echo "-- checking out: (${branchArr[$1]})"
        git checkout ${branchArr[$1]}
    fi
}

function glo() {
    [ -z "$1" ] && n=5 || n=$1

    if [[ $1 == '+' ]]; then
        git log --oneline
    else
        git log --oneline -n $n
    fi
}

function hexstr() {
    [ -z "$1" ] && n=16 || n=$1

    node -e "console.log(require('crypto').randomBytes($n).toString('hex'))"
}

function amb() {
    local osrs_dir="${1:-$HOME/Documents/ambient/osrs}"
    local cloudrs_dir="${2:-$HOME/Documents/ambient/cloudrs}"

    # kill old session if it exists
    tmux kill-session -t ambient 2>/dev/null

    # Start a new detached session
    tmux new-session -d -s ambient

    # --- Window 1 (complex layout) ---
    tmux send-keys -t ambient:1 "clear && cd $osrs_dir" C-m

    # Split window into 8 panes
    tmux split-window -h -t ambient:1 -c "$osrs_dir"
    tmux split-window -h -t ambient:1 -c "$osrs_dir"
    tmux split-window -h -t ambient:1 -c "$osrs_dir"
    tmux split-window -h -t ambient:1 -c "$osrs_dir"
    tmux split-window -v -t ambient:1 -c "$osrs_dir"
    tmux split-window -v -t ambient:1 -c "$osrs_dir"
    tmux split-window -v -t ambient:1 -c "$osrs_dir"

    # Set to tiled
    tmux select-layout tiled

    # --- Window 2 ---
    tmux new-window -t ambient:2 -c "$osrs_dir"

    # --- Window 3 (two vertical panes) ---
    tmux new-window -t ambient:3 -c "$cloudrs_dir"
    tmux split-window -h -t ambient:3 -c "$cloudrs_dir"

    # Focus back to first window
    tmux select-window -t ambient:1

    # Attach
    tmux attach-session -t ambient
}

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
    if [ -f /usr/share/bash-completion/bash_completion ]; then
        . /usr/share/bash-completion/bash_completion
    elif [ -f /etc/bash_completion ]; then
        . /etc/bash_completion
    fi
fi

# get current branch in git repo
function parse_git_branch() {
    BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
    if [ ! "${BRANCH}" == "" ]; then
        # logic to substr with elipsis -- kinda feels like losing info
        # if [ ${#BRANCH} -ge 40 ]; then
        # 	BRANCH=$(echo $BRANCH | awk '{ printf "%s...%s\n", substr($1, 1, 20), substr($1, length($1) - 19) }')
        # fi

        STAT=`parse_git_dirty`
        echo "[${BRANCH}${STAT}]"
    else
        echo ""
    fi
}

# get current status of git repo
function parse_git_dirty {
    status=`git status 2>&1 | tee`
    dirty=`echo -n "${status}" 2> /dev/null | grep "modified:" &> /dev/null; echo "$?"`
    untracked=`echo -n "${status}" 2> /dev/null | grep "Untracked files" &> /dev/null; echo "$?"`
    ahead=`echo -n "${status}" 2> /dev/null | grep "Your branch is ahead of" &> /dev/null; echo "$?"`
    newfile=`echo -n "${status}" 2> /dev/null | grep "new file:" &> /dev/null; echo "$?"`
    renamed=`echo -n "${status}" 2> /dev/null | grep "renamed:" &> /dev/null; echo "$?"`
    deleted=`echo -n "${status}" 2> /dev/null | grep "deleted:" &> /dev/null; echo "$?"`
    bits=''
    if [ "${renamed}" == "0" ]; then
        bits=">${bits}"
    fi
    if [ "${ahead}" == "0" ]; then
        bits="*${bits}"
    fi
    if [ "${newfile}" == "0" ]; then
        bits="+${bits}"
    fi
    if [ "${untracked}" == "0" ]; then
        bits="?${bits}"
    fi
    if [ "${deleted}" == "0" ]; then
        bits="x${bits}"
    fi
    if [ "${dirty}" == "0" ]; then
        bits="!${bits}"
    fi
    if [ ! "${bits}" == "" ]; then
        echo " ${bits}"
    else
        echo ""
    fi
}

export PS1="\[\e[33m\][\[\e[m\]\[\e[32m\]\u\[\e[m\]\[\e[33m\]:\[\e[m\]\[\e[36m\]\W\[\e[m\]\[\e[33m\]]\[\e[m\]\[\e[35m\]\`parse_git_branch\`\[\e[m\]\[\e[31m\]\\$\[\e[m\] "

# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="/opt/homebrew/opt/postgresql@15/bin:$PATH"

export raspberry="192.168.0.28"
export macedonia="192.168.0.43"

# ruby/gem
export GEM_HOME=$HOME/.gem
export PATH=$GEM_HOME/bin:$PATH

# Android dev
export ANDROID_HOME=/Users/mcaminiti/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin/
export PATH=$PATH:$ANDROID_HOME/build-tools/
export PATH=$PATH:$ANDROID_HOME/emulator/

# Tizen dev
export PATH="$PATH:/Users/mcaminiti/Applications/tizen-studio/tools/tizen-core:/Users/mcaminiti/Applications/tizen-studio/tools/ide/bin:/Users/mcaminiti/Applications/tizen-studio/tools"

# Setting PATH for Python 3.11
# The original version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/3.11/bin:${PATH}"
# export PATH

. "$HOME/.cargo/env"

export RUST_LOG=info
export DISABLE_FRUITY_LOGS=1

export amb1="100.81.37.121"
export amb2="100.76.253.74"
export amb3="100.74.38.18"
export amb4="100.104.119.40"
export amb5="100.92.35.4"

export PATH="$PATH:/Users/mcaminiti/Documents/personal/tyte"
export PATH="$PATH:/Users/mcaminiti/.local/bin"
