# git
alias gs='git status'

# sublime
alias sublime='subl'

# json
alias json="python -m json.tool"

# exa
alias ls='exa --icons'
alias tree='exa --icons --tree --ignore-glob="node_modules"'

# nvim
# alias vim="~/.local/bin/nvim.appimage"
# alias nvim="~/.local/bin/nvim.appimage"

# tmux
alias tmux="tmux -2"

# Add an "alert" alias for long running commands.  Use like so "$ sleep 10; alert"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# DING
alias b="echo -en '\a'"

# colourful cat
alias cat='bat -pp'
