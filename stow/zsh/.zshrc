# Start configuration added by Zim install {{{
#
# User configuration sourced by interactive shells
#

# -----------------
# Zsh configuration
# -----------------

#
# History
#

# Remove older command from the history if a duplicate is to be added.
setopt HIST_IGNORE_ALL_DUPS

#
# Input/output
#

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# Prompt for spelling correction of commands.
#setopt CORRECT

# Customize spelling correction prompt.
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '

# Remove path separator from WORDCHARS.
WORDCHARS=${WORDCHARS//[\/]}


# --------------------
# Module configuration
# --------------------

#
# completion
#

# Set a custom path for the completion dump file.
# If none is provided, the default ${ZDOTDIR:-${HOME}}/.zcompdump is used.
#zstyle ':zim:completion' dumpfile "${ZDOTDIR:-${HOME}}/.zcompdump-${ZSH_VERSION}"

#
# git
#

# Set a custom prefix for the generated aliases. The default prefix is 'G'.
#zstyle ':zim:git' aliases-prefix 'g'

#
# input
#

# Append `../` to your input for each `.` you type after an initial `..`
zstyle ':zim:input' double-dot-expand yes

#
# termtitle
#

# Set a custom terminal title format using prompt expansion escape sequences.
# See http://zsh.sourceforge.net/Doc/Release/Prompt-Expansion.html#Simple-Prompt-Escapes
# If none is provided, the default '%n@%m: %~' is used.
#zstyle ':zim:termtitle' format '%1~'

#
# zsh-autosuggestions
#

# Customize the style that the suggestions are shown with.
# See https://github.com/zsh-users/zsh-autosuggestions/blob/master/README.md#suggestion-highlight-style
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=10'

#
# zsh-syntax-highlighting
#

# Set what highlighters will be used.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters.md
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)

# Customize the main highlighter styles.
# See https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/docs/highlighters/main.md#how-to-tweak-it
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=10'

#
# pacman
#

# Wrap pacman commands with pikaur
zstyle ':zim:pacman' frontend 'pikaur'
# Add aur shortcuts
#zstyle ':zim:pacman' helpers 'aur'

# ------------------
# Initialize modules
# ------------------

if [[ ${ZIM_HOME}/init.zsh -ot ${ZDOTDIR:-${HOME}}/.zimrc ]]; then
  # Update static initialization script if it's outdated, before sourcing it
  source ${ZIM_HOME}/zimfw.zsh init -q
fi
source ${ZIM_HOME}/init.zsh

# ------------------------------
# Post-init module configuration
# ------------------------------

#
# zsh-history-substring-search
#

# Bind ^[[A/^[[B manually so up/down works both before and after zle-line-init
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Bind up and down keys
zmodload -F zsh/terminfo +p:terminfo
if [[ -n ${terminfo[kcuu1]} && -n ${terminfo[kcud1]} ]]; then
  bindkey ${terminfo[kcuu1]} history-substring-search-up
  bindkey ${terminfo[kcud1]} history-substring-search-down
fi

bindkey '^P' history-substring-search-up
bindkey '^N' history-substring-search-down
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
# }}} End configuration added by Zim install

#####################
# SETUP ENVIRONMENT #
#####################

# Add binaries from dotfiles
PATH=$HOME/dotfiles/bin:$HOME/.local/bin:$HOME/.ebcli-virtual-env/executables:$PATH

# docker.sock host path fix
# daemon path got out of sync with client, client still defaults to
# /var/run/docker/sock
export DOCKER_HOST=unix:///run/docker.sock

# use intel-media-driver for va-api
export LIBVA_DRIVER_NAME=iHD

# DPI Fix for alacritty
export WINIT_HIDPI_FACTOR=1.0

export TERMINAL=alacritty
export VISUAL=nvim
export EDITOR=nvim
export BROWSER=firefox-developer-edition

# Solarized Dircolors
# see: https://github.com/seebi/dircolors-solarized
eval `dircolors $HOME/.config/zsh/dir_colors`

# ref: https://wiki.archlinux.org/index.php/Uniform_look_for_Qt_and_GTK_applications#Styles_for_both_Qt_and_GTK+
export QT_QPA_PLATFORMTHEME='gnome'
export XDG_CURRENT_DESKTOP=GNOME
export QT_STYLE_OVERRIDE=adwaita

# prevent Firefox from creating Desktop directory
export XDG_DESKTOP_DIR="$HOME/Downloads"

# GnuPG
# Set to current
export GPG_TTY=$(tty)
# Refresh gpg-agent tty in case user switches into an X session
gpg-connect-agent updatestartuptty /bye >/dev/null

# Use local node modules binaries before global binaries
PATH=./node_modules/.bin:$PATH

# Add Garmin ConnectIQ Binaries
PATH=$PATH:$HOME/work/connectiq_sdk/bin

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Init FZF
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh

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

  export FZF_DEFAULT_COMMAND='fd -H -E .git --no-ignore-vcs --type f'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
}
_gen_fzf_default_opts

# Disable LiquidPrompt temperature sensor calls on linode machine
# Do this before initializing Zimfw or liquidprompt
if [ "$HOSTNAME" = linode ]; then
  LP_ENABLE_TEMP=0
fi

# Only load Liquid Prompt in interactive shells, not from a script or from scp
[[ $- = *i* ]] && source ~/liquidprompt/liquidprompt

[ -f ${HOME}/.config/zsh/personal/init.zsh ] && source ${HOME}/.config/zsh/personal/init.zsh
[ -f ${HOME}/.config/zsh/docker/init.zsh ] && source ${HOME}/.config/zsh/docker/init.zsh
