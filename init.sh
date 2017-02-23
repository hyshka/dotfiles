#!/bin/sh

function doIt() {
  # bin
  rm -Rf ~/.bin
  ln -s ~/dotfiles/bin ~/.bin

  # zsh
  rm -f ~/.zshrc
  rm -f ~/.zlogin
  rm -f ~/.zimrc
  rm -Rf ~/.zim/modules/custom
  rm -f ~/.fpath
  ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
  ln -s ~/dotfiles/zsh/zlogin ~/.zlogin
  ln -s ~/dotfiles/zsh/zimrc ~/.zimrc
  ln -s ~/dotfiles/zsh/fpath ~/.fpath
  ln -s ~/dotfiles/zsh/custom ~/.zim/modules/custom
  # source ~/.zshrc
  # source ${ZDOTDIR:-${HOME}}/.zlogin

  # vim
  rm -f ~/.vimrc
  ln -s ~/dotfiles/vim/vimrc ~/.vimrc

  # neovim
  rm -Rf ~/.config/nvim
  ln -s ~/dotfiles/nvim ~/.config/nvim

  # x11
  rm -f ~/.Xresources
  ln -s ~/dotfiles/x11/Xresources ~/.Xresources
  # xrdb ~/.Xresources

  # ranger
  mkdir -p ~/.config/ranger/colorschemes
  rm -f ~/.config/ranger/rc.conf
  rm -f ~/.config/ranger/bookmarks
  ln -s ~/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
  ln -s ~/dotfiles/ranger/bookmarks ~/.config/ranger/bookmarks

  # i3
  mkdir -p ~/.config/i3
  rm -f ~/.config/i3/i3status.conf
  rm -f ~/.config/i3/config
  rm -f ~/.config/i3/compton.conf
  rm -f ~/.config/i3/base16-railscasts.yaml
  if [ "$HOSTNAME" = brix ]; then
    ln -s ~/dotfiles/i3/config_brix ~/.config/i3/config
    ln -s ~/dotfiles/i3/i3status_brix ~/.config/i3/i3status.conf
  else
    ln -s ~/dotfiles/i3/config_w520 ~/.config/i3/config
    ln -s ~/dotfiles/i3/i3status_w520 ~/.config/i3/i3status.conf
  fi
  ln -s ~/dotfiles/i3/compton.conf ~/.config/i3/compton.conf
  ln -s ~/dotfiles/i3/base16-railscasts.yaml ~/.config/i3/base16-railscasts.yaml

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

  # subl3
  mkdir -p ~/.config/sublime-text-3/Packages/User
  rm -f ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
  rm -f ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
  rm -f ~/.config/sublime-text-3/Packages/User/ColorHighlighter.sublime-settings
  ln -s ~/dotfiles/subl3/'Default (Linux).sublime-keymap' ~/.config/sublime-text-3/Packages/User/'Default (Linux).sublime-keymap'
  ln -s ~/dotfiles/subl3/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
  ln -s ~/dotfiles/subl3/ColorHighlighter.sublime-settings ~/.config/sublime-text-3/Packages/User/ColorHighlighter.sublime-settings
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
