#!/bin/bash

# git
alias gs='git status'

# sublime
alias sublime='/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl'

# neovim
alias nvim='/opt/nvim-linux-x86_64/bin/nvim'

# json
alias json="python3 -m json.tool"

# exa
alias ls='exa --icons'
alias ll='exa --icons -l'
alias la='exa --icons -la'
alias tree='exa --icons --tree --ignore-glob="node_modules"'

# tmux
alias tmux="tmux -2"

# Add an "alert" alias for long running commands.  Use like so "$ sleep 10; alert"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# DING
alias b="echo -en '\a'"

# Golang
alias gf="gofmt -w -s -l ."

# BAT BAT
alias cat="batcat -pp"

# DAWKA
# alias dcl='docker container ls --format "table {{.ID}}\t{{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dcd='docker-compose down'
alias dcu='docker-compose up -d'

################
# Ambient

# list AVFoundation devices
alias devices='ffmpeg -f avfoundation -list_devices true -i ""'

alias amb1='ssh -i ~/.ssh/ambient_ed25519 matthew@100.81.37.121'

alias repipe='systemctl --user restart pipewire pipewire-pulse wireplumber'
