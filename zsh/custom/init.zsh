# Custom aliases/settings
#

# any custom stuff should go here.
# ensure that 'custom' exists in the zmodules array in your .zimrc

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
alias calc="="

# custom commands
alias uh="urxvt &"
alias xev="xev | grep -A2 --line-buffered '^KeyRelease' | sed -n '/keycode /s/^.*keycode \([0-9]*\).* (.*, \(.*\)).*$/\1 \2/p'"
alias xClass="xprop | grep WM_CLASS"
alias chromiumcors="chromium --disable-web-security --user-data-dir=$HOME/.config/chromium-dev &"
alias timer="/opt/activecollab-timer/activecollab-timer &"
alias gp6="bash /opt/GuitarPro6/launcher.sh"
alias remo="TERM=screen-256color ssh linode"
alias makepkgfast="BUILDDIR=/tmp/makepkg makepkg"
alias cala="gcalcli agenda"

# services
alias srvup="sudo systemctl start httpd mysqld"
alias srvdown="sudo systemctl stop httpd mysqld"
alias dhcpeth="sudo systemctl restart dhcpcd@enp0s31f6"

# i3-style
alias i3t="i3-style ~/.dotfiles/i3/base16-tomorrow.yaml -o ~/.config/i3/config --reload"
alias i3tn="i3-style ~/.dotfiles/i3/base16-tomorrow-night.yaml -o ~/.config/i3/config --reload"

# tmuxp sessions
alias tph="tmuxp load ~/.config/tmuxp/dashboard_home.yaml"
alias tpw="tmuxp load ~/.config/tmuxp/dashboard_work.yaml"
alias tpdot="tmuxp load ~/.config/tmuxp/dotfiles.yaml"
alias tppg="tmuxp load ~/.config/tmuxp/postgres.yaml"

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

# manage.py
alias pm="python manage.py"
alias pmr="python manage.py runserver"
alias pmrp='python manage.py runserver_plus'
alias pmr2='python manage.py runserver 127.0.0.1:8080'
alias pmm='python manage.py migrate'
alias pms='python manage.py syncdb'
alias pmsh='python manage.py shell'
alias pmshp='python manage.py shell_plus'

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

# nvm
alias n10="nvm use 0.10"
alias n4="nvm use 4"
alias n5="nvm use 5"
alias n6="nvm use 6"

# rvm
alias r1="rvm use 1.9.3"

# assh
#alias ssh="~/.gocode/bin/assh wrapper ssh"
