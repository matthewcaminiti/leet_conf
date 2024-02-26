#!/bin/bash

# git
alias gs='git status'

# sublime
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# nvim
alias nvim="$HOME/.local/bin/nvim-macos/bin/nvim"

# json
alias json="python3 -m json.tool"

# exa
alias ls='exa --icons'
alias ll='exa --icons -l'
alias tree='exa --icons --tree --ignore-glob="node_modules"'

# tmux
alias tmux="tmux -2"

# Add an "alert" alias for long running commands.  Use like so "$ sleep 10; alert"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# DING
alias b="echo -en '\a'"

# Golang
alias gtc="sed '/===/d' | sed ''/PASS/s//$(printf "$(tput setaf 2)PASS$(tput setaf 7)")/'' | sed ''/FAIL/s//$(printf "$(tput setaf 1)FAIL$(tput setaf 7)")/'' | sed ''/SKIP/s//$(printf "$(tput setaf 3)SKIP$(tput setaf 7)")/''"
# alias gtc="sed '/===/d' | sed ''/PASS/s//$(printf "\033[32mPASS\033[0m")/'' | sed ''/FAIL/s//$(printf "\033[31mFAIL\033[0m")/'' | sed ''/SKIP/s//$(printf "\033[31mSKIP\033[0m")/''"
alias gf="gofmt -w -s -l ."

# BAT BAT
alias cat="bat -pp"

# DAWKA
# alias dcl='docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dcd='docker-compose down'
alias dcu='docker-compose up -d'

# Commerce
alias comm-u='cd ~/Documents/commerce/dev/commerce && dcu; cd ~/Documents/commerce/dev/payments && dcu; cd ~/Documents/commerce'
alias comm-d='cd ~/Documents/commerce/dev/commerce && dcd -v; cd ~/Documents/commerce/dev/payments && dcd -v; cd ~/Documents/commerce'
