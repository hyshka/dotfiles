#!/usr/bin/env bash

function doIt() {
  # bin
  rm -R ~/.bin
  ln -s ~/.dotfiles/bin ~/.bin

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
  mkdir -p ~/.config/ranger/colorschemes
  rm -r ~/.config/ranger/rc.conf
  rm -r ~/.config/ranger/bookmarks
  ln -s ~/.dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
  ln -s ~/.dotfiles/ranger/bookmarks ~/.config/ranger/bookmarks

  # i3
  mkdir -p ~/.config/i3
  rm -r ~/.config/i3/i3status.conf
  rm -r ~/.config/i3/config
  rm -r ~/.config/i3/compton.conf
  rm -r ~/.config/i3/base16-railscasts.yaml
  if [ "$HOSTNAME" = brix ]; then
    ln -s ~/.dotfiles/i3/config_brix ~/.config/i3/config
    ln -s ~/.dotfiles/i3/i3status_brix ~/.config/i3/i3status.conf
  else
    ln -s ~/.dotfiles/i3/config_w520 ~/.config/i3/config
    ln -s ~/.dotfiles/i3/i3status_w520 ~/.config/i3/i3status.conf
  fi
  ln -s ~/.dotfiles/i3/compton.conf ~/.config/i3/compton.conf
  ln -s ~/.dotfiles/i3/base16-railscasts.yaml ~/.config/i3/base16-railscasts.yaml

  # git
  rm -r ~/.gitconfig
  rm -r ~/.gitignore
  ln -s ~/.dotfiles/git/gitconfig ~/.gitconfig
  ln -s ~/.dotfiles/git/gitignore ~/.gitignore

  # subl3
  mkdir -p ~/.config/sublime-text-3/Packages/User
  rm -r ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
  rm -r ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
  rm -r ~/.config/sublime-text-3/Packages/User/ColorHighlighter.sublime-settings
  ln -s ~/.dotfiles/subl3/'Default (Linux).sublime-keymap' ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
  ln -s ~/.dotfiles/subl3/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
  ln -s ~/.dotfiles/subl3/ColorHighlighter.sublime-settings ~/.config/sublime-text-3/Packages/User/ColorHighlighter.sublime-settings

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
