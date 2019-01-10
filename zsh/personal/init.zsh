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
alias xev="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
alias xClass="xprop | grep WM_CLASS"
alias chromiumcors="chromium --disable-web-security --user-data-dir=$HOME/.config/chromium-dev &"
alias gp6="bash /opt/GuitarPro6/launcher.sh"
alias makepkgram="BUILDDIR=/tmp/makepkg makepkg"
alias cala="gcalcli agenda"
alias bhp='echo -e "power on\nconnect 74:5C:4B:B4:3C:86" | bluetoothctl'

# xrandr
alias xeo="xrandr --output HDMI1 --off"
alias xea="xrandr --output HDMI1 --auto --output eDP1 --auto --right-of HDMI1"
alias xet="xrandr --output HDMI1 --off; xrandr --output HDMI1 --auto --output eDP1 --auto --right-of HDMI1"
alias xe="xrandr --output HDMI1 --auto --output eDP1 --off"
alias xi="xrandr --output eDP1 --auto --output HDMI1 --off"

# clipboard
alias pyclip="python ~/.bin/pyclip.py"
alias cb="xsel --clipboard"
alias clip="nc -w 1 localhost 41401"

# tmuxp sessions
alias tph="tmuxp load ~/.config/tmuxp/dashboard_home.yaml"
alias tpw="tmuxp load ~/.config/tmuxp/dashboard_work.yaml"
alias tpdot="tmuxp load ~/.config/tmuxp/dotfiles.yaml"
alias tpdb="tmuxp load ~/.config/tmuxp/database.yaml"
alias tpsp="tmuxp load ~/.config/tmuxp/scratchpad.yaml"

# git shortcuts (mostly in zim module)
alias gch="git cherry-pick"

# npm shortcuts that only list top-level modules
# ! overrides the line-number utility
alias ng="npm list -g --depth=0 2>/dev/null"
alias nl="npm list --depth=0 2>/dev/null"

# wine
alias win32="WINEARCH=win32 WINEPREFIX=~/win32"
alias win64="WINEARCH=win64 WINEPREFIX=~/win64"
