help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install the symlink
	# TODO: install packages
	# sudo
	# stow 
	# ranger highlight libcaca mediainfo perl-image-exiftool poppler w3m
	# gnupg pinentry git
	# zsh 
	# neomutt
	# tmux tmuxp
	# i3-wm rofi terminus-font buku dunst keynav python-pyperclip
	# alacritty alacritty-term-info
	# neovim python-neovim python-black fzf the_silver_searcher netcat bash prettier
	# gvim
	# fzf fd
	# zeal
	# firefox-developer-edition chromium
	# gimp inkscape
	# vimiv
	# flameshot
	# transmission-gtk mpv libreoffic-fresh zathura gpaste htop
	# virtualbox virtualbox-host-modules-arcg
	# openssh
	# rsync
	# mosh
	# weechat
	# acpi
	#
	# Display manager:
	# xorg-server xf86-video-intel xorg-xinit vulkan-intel intel-media-driver xorg-xrandr
	#
	# Sound:
	# alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils pavucontrol
	#
	# Install packages from AUR: j4-make-config-git polybar buku_run-git osync spotify airvpn-bin
	# opt: studio-3t intellij-idea-ultimate-edition
	#
	# Post-install:
	# systemctl --user enable gpaste.service
	# systemctl --user start gpaste.service
	# systemctl --user enable keynav.service
	# systemctl --user start keynav.service
	# ln -s ~/dotfiles/bin ~/.bin
	#
	#
	git clone git@github.com:tadly/rofi-wrapper.git ~/dotfiles/repos/rofi-wrapper
	# TODO: install zimfw

uninstall: ## Remove the sumlink
	rm -rf ~/dotfiles/repos/rofi-wrapper
