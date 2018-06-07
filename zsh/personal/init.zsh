#
# Personal aliases/settings
#

# ensure that 'personal' exists in the zmodules array in your .zimrc

##################
# SHELL SETTINGS #
##################

# autocompletion of command line switches for aliases
# setopt COMPLETE_ALIASES

# vim-style term keybinds
bindkey -v

###########
# ALIASES #
###########

# misc shortcuts
alias sx=startx
alias vi=vim
alias t=tmux

# custom commands
alias uh="urxvt &"
alias xev="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
alias xClass="xprop | grep WM_CLASS"
alias chromiumcors="chromium --disable-web-security --user-data-dir=$HOME/.config/chromium-dev &"
alias gp6="bash /opt/GuitarPro6/launcher.sh"
alias remo="ssh linode"
alias makepkgfast="BUILDDIR=/tmp/makepkg makepkg"
alias cala="gcalcli agenda"

# xrandr
alias xeo="xrandr --output HDMI-1 --off"
alias xea="xrandr --output HDMI-1 --auto --output eDP-1 --auto --right-of HDMI-1"
alias xet="xrandr --output HDMI-1 --off; xrandr --output HDMI-1 --auto --output eDP-1 --auto --right-of HDMI-1"
alias xe="xrandr --output HDMI-1 --auto --output eDP-1 --off"
alias xi="xrandr --output eDP-1 --auto --output HDMI-1 --off"

# clipboard
alias cb="xsel --clipboard"
alias clip="nc -N localhost 8377"

# i3-style
alias i3t="i3-style ~/.dotfiles/i3/base16-tomorrow.yaml -o ~/.config/i3/config --reload"
alias i3tn="i3-style ~/.dotfiles/i3/base16-tomorrow-night.yaml -o ~/.config/i3/config --reload"

# tmuxp sessions
alias tph="tmuxp load ~/.config/tmuxp/dashboard_home.yaml"
alias tpw="tmuxp load ~/.config/tmuxp/dashboard_work.yaml"
alias tpdot="tmuxp load ~/.config/tmuxp/dotfiles.yaml"
alias tppg="tmuxp load ~/.config/tmuxp/postgres.yaml"
alias tpmy="tmuxp load ~/.config/tmuxp/mysql.yaml"
alias tpsp="tmuxp load ~/.config/tmuxp/scratchpad.yaml"

# django-admin.py
alias dj=django-admin.py
alias djr='django-admin.py runserver'
alias djrp='django-admin.py runserver_plus'
alias djr2='django-admin.py runserver 127.0.0.1:8080'
alias djm='django-admin.py migrate'
alias djmm='django-admin.py makemigrations'
alias djs='django-admin.py syncdb'
alias djsh='django-admin.py shell'
alias djshp='django-admin.py shell_plus'

# pip
alias pi="pip install"
alias pu="pip uninstall"
alias pf="pip freeze"
alias pfg="pip freeze | grep"

# git shortcuts (mostly in zim module)
alias gch="git cherry-pick"

# npm shortcuts that only list top-level modules
# ! overrides the line-number utility
alias ng="npm list -g --depth=0 2>/dev/null"
alias nl="npm list --depth=0 2>/dev/null"

# wine
alias win32="WINEARCH=win32 WINEPREFIX=~/win32"
alias win64="WINEARCH=win64 WINEPREFIX=~/win64"
