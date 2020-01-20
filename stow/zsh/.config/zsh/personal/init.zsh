#
# Personal aliases/settings
#

# ensure that 'personal' exists in the zmodules array in your .zimrc

fpath+=~/.config/zsh/personal/functions/
autoload tpd

###########
# ALIASES #
###########

# misc shortcuts
alias sx=startx
alias vi=vim
alias t=tmux
alias b='buku --suggest'

# custom commands
alias xev="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
alias xClass="xprop | grep WM_CLASS"
alias chromiumcors="chromium --disable-web-security --user-data-dir=$HOME/.config/chromium-dev &"
alias gp6="bash /opt/GuitarPro6/launcher.sh"
alias makepkgram="BUILDDIR=/tmp/makepkg makepkg"
alias cala="gcalcli agenda"
alias bhp='echo -e "connect 74:5C:4B:B4:3C:86\n" | bluetoothctl'
alias pyhttp="python -m http.server"
alias pacclean="paccache -k 2 -r && paccache -k 0 -ur"
alias garmin="WINEPREFIX=/home/hyshka/GarminExpress wine explorer /desktop=garmin,1366x768 '/home/hyshka/GarminExpress/drive_c/Program Files/Garmin/Express/express.exe'"

# xrandr
alias xi="xrandr --output eDP-1 --primary --auto --output HDMI-1 --off"
alias xe="xrandr --output HDMI-1 --primary --auto --output eDP-1 --off"
alias xel="xrandr --output HDMI-1 --primary --auto --output eDP-1 --auto --left-of HDMI-1"
alias xer="xrandr --output HDMI-1 --primary --auto --output eDP-1 --auto --right-of HDMI-1"
alias xeo="xrandr --output HDMI-1 --noprimary --off"

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

# npm shortcuts that only list top-level modules
# ! overrides the line-number utility
alias ng="npm list -g --depth=0 2>/dev/null"
alias nl="npm list --depth=0 2>/dev/null"

# wine
alias win32="WINEARCH=win32 WINEPREFIX=~/win32"
alias win64="WINEARCH=win64 WINEPREFIX=~/win64"
