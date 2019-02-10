#!/bin/sh

function doIt() {
  # bin
  rm -Rf ~/.bin
  ln -s ~/dotfiles/bin ~/.bin

  # zsh
  rm -f ~/.zshrc
  rm -f ~/.zlogin
  rm -f ~/.zimrc
  rm -Rf ~/.zim/modules/personal
  rm -Rf ~/.zim/modules/docker
  rm -f ~/.fpath
  ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
  ln -s ~/dotfiles/zsh/zlogin ~/.zlogin
  ln -s ~/dotfiles/zsh/zimrc ~/.zimrc
  ln -s ~/dotfiles/zsh/fpath ~/.fpath
  ln -s ~/dotfiles/zsh/personal ~/.zim/modules/personal
  ln -s ~/dotfiles/zsh/docker ~/.zim/modules/docker
  # source ~/.zshrc
  # source ${ZDOTDIR:-${HOME}}/.zlogin

  # neovim
  rm -Rf ~/.config/nvim
  ln -s ~/dotfiles/nvim ~/.config/nvim

  # x11
  rm -f ~/.Xresources
  ln -s ~/dotfiles/x11/Xresources ~/.Xresources
  # xrdb ~/.Xresources

  # ranger
  rm -Rf ~/.config/ranger
  ln -s ~/dotfiles/ranger ~/.config/ranger

  # i3
  rm -Rf ~/.config/i3
  rm -Rf ~/dotfiles/i3/i3status.conf
  ln -s ~/dotfiles/i3 ~/.config/i3
  if [ "$HOSTNAME" = veyron ]; then
    j4-make-config -a config_veyron solarized_light
    ln -s ~/dotfiles/i3/i3status_veyron ~/dotfiles/i3/i3status.conf
  fi
  if [ "$HOSTNAME" = gandof ]; then
    j4-make-config -a config_gandof solarized_light
    ln -s ~/dotfiles/i3/i3status_gandof ~/dotfiles/i3/i3status.conf
  fi

  # git
  rm -f ~/.gitconfig
  rm -f ~/.gitignore
  ln -s ~/dotfiles/git/gitconfig ~/.gitconfig
  ln -s ~/dotfiles/git/gitignore ~/.gitignore

  # tmux
  rm -f ~/.tmux.conf
  rm -Rf ~/.config/tmuxp
  ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
  ln -s ~/dotfiles/tmux/tmuxp ~/.config/tmuxp

  # gnupg
  rm -f ~/.gnupg/gpg-agent.conf
  mkdir -p ~/.gnupg
  ln -s ~/dotfiles/gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf

  # mutt
  rm -Rf ~/.mutt
  ln -s ~/dotfiles/mutt ~/.mutt

  # polybar
  rm -Rf ~/.config/polybar
  ln -s ~/dotfiles/polybar ~/.config/polybar

  # alacritty
  rm -Rf ~/.config/alacritty
  ln -s ~/dotfiles/alacritty ~/.config/alacritty
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
  doIt;
else
  read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
  echo "";
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    doIt;
  fi;
fi;
unset doIt;
