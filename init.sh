#!/usr/bin/env bash

function doIt() {
  # zsh
  rm -r ~/.zshrc
  rm -r ~/.zprofile
  rm -r ~/.zshenv
  rm -r ~/.zimrc
  ln -s ~/.dotfiles/zsh/zshrc ~/.zshrc
  ln -s ~/.dotfiles/zsh/zprofile ~/.zprofile
  ln -s ~/.dotfiles/zsh/zshenv ~/.zshenv
  ln -s ~/.dotfiles/zsh/zimrc ~/.zimrc

  # vim
  rm -r ~/.vimrc
  ln -s ~/.dotfiles/vim/vimrc ~/.vimrc

  # x11
  rm -r ~/.Xresources
  ln -s ~/.dotfiles/x11/Xresources ~/.Xresources

  # ranger
  rm -r ~/config/ranger
  ln -s ~/.dotfiles/ranger ~/.config/ranger

  # i3
  rm -r ~/config/i3/i3status.conf
  rm -r ~/config/i3/config
  rm -r ~/config/i3/conkyrc
  rm -r ~/config/i3/compton.conf
  rm -r ~/config/i3/base16-railscasts.yaml
  ln -s ~/.dotfiles/i3/i3status.conf ~/.config/i3/i3status.conf
  ln -s ~/.dotfiles/i3/config ~/.config/i3/config
  ln -s ~/.dotfiles/i3/conkyrc ~/.config/i3/conkyrc
  ln -s ~/.dotfiles/i3/compton.conf ~/.config/i3/compton.conf
  ln -s ~/.dotfiles/i3/base16-railscasts.yaml ~/.config/i3/base16-railscasts.yaml

  # git
  rm -r ~/.gitconfig
  rm -r ~/.gitignore
  ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
  ln -s ~/.dotfiles/git/gitignore ~/.gitignore

  xrdb ~/.Xresources
  source ~/.zshrc
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
