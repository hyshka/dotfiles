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

  # vim
  rm -Rf ~/.vim
  rm -f ~/.vimrc
  ln -s ~/dotfiles/vim ~/.vim
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
  rm -f ~/.config/ranger/commands.py
  rm -f ~/.config/ranger/scope.sh
  ln -s ~/dotfiles/ranger/rc.conf ~/.config/ranger/rc.conf
  ln -s ~/dotfiles/ranger/bookmarks ~/.config/ranger/bookmarks
  ln -s ~/dotfiles/ranger/commands.py ~/.config/ranger/commands.py
  ln -s ~/dotfiles/ranger/scope.sh ~/.config/ranger/scope.sh

  # i3
  mkdir -p ~/.config/i3
  rm -f ~/.config/i3/i3status.conf
  rm -f ~/.config/i3/config
  if [ "$HOSTNAME" = veyron ]; then
    cat ~/dotfiles/i3/colors ~/dotfiles/i3/base ~/dotfiles/i3/config_veyron > ~/.config/i3/config
    ln -s ~/dotfiles/i3/i3status_veyron ~/.config/i3/i3status.conf
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

  # clipper
  rm -rf ~/.config/clipper
  ln -s ~/dotfiles/clipper ~/.config/clipper
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
