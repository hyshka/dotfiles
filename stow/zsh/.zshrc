#####################
# SETUP ENVIRONMENT #
#####################

# Add binaries from dotfiles
PATH=$HOME/dotfiles/bin:$HOME/.local/bin:$PATH

# DPI Fix for alacritty
export WINIT_HIDPI_FACTOR=1.0

export TERMINAL=alacritty
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=firefox-developer-edition

# Solarized Dircolors
# see: https://github.com/seebi/dircolors-solarized
eval `dircolors $HOME/.config/zsh/dir_colors`

# set qt5 to use adwaita
# ref: https://wiki.archlinux.org/index.php/Uniform_look_for_Qt_and_GTK_applications#Styles_for_both_Qt_and_GTK+
QT_QPA_PLATFORMTHEME=gtk2

# prevent Firefox from creating Desktop directory
export XDG_DESKTOP_DIR="$HOME/Downloads"

# GnuPG
# Set to current
export GPG_TTY=$(tty)
# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

# Use local node modules binaries before global binaries
PATH=./node_modules/.bin:$PATH

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Init FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# FZF style
_gen_fzf_default_opts() {
  local base03="234"
  local base02="235"
  local base01="240"
  local base00="241"
  local base0="244"
  local base1="245"
  local base2="254"
  local base3="230"
  local yellow="136"
  local orange="166"
  local red="160"
  local magenta="125"
  local violet="61"
  local blue="33"
  local cyan="37"
  local green="64"

  # Solarized Dark color scheme for fzf
  # export FZF_DEFAULT_OPTS="
  #   --color fg:-1,bg:-1,hl:$blue,fg+:$base2,bg+:$base02,hl+:$blue
  #   --color info:$yellow,prompt:$yellow,pointer:$base3,marker:$base3,spinner:$yellow
  # "

  ## Solarized Light color scheme for fzf
  export FZF_DEFAULT_OPTS="
    --color fg:-1,bg:-1,hl:$blue,fg+:$base02,bg+:$base2,hl+:$blue
    --color info:$yellow,prompt:$yellow,pointer:$base03,marker:$base03,spinner:$yellow
  "

  export FZF_DEFAULT_COMMAND='fd --type f'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}
_gen_fzf_default_opts

# Disable LiquidPrompt temperature sensor calls on linode machine
# Do this before initializing Zimfw
if [ "$HOSTNAME" = linode ]; then
  LP_ENABLE_TEMP=0
fi

# Prevent slowdown in typeracer git repo
LP_DISABLED_VCS_PATH=$HOME/work/teachme/typeracer

# Zimfw
if [[ -s ${ZDOTDIR:-${HOME}}/.zim/init.zsh ]]; then
  source ${ZDOTDIR:-${HOME}}/.zim/init.zsh
fi
