help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install the symlink

	# These should be separate:
	# Display manager:
	# xorg-server xf86-video-intel xorg-xinit vulkan-intel intel-media-driver xorg-xrandr
	#
	# Sound:
	# alsa-utils pulseaudio pulseaudio-alsa pulseaudio-bluetooth bluez bluez-libs bluez-utils pavucontrol

	# pre-req: git openssh opendoas/sudo base-devel pikaur(AUR)
	doas pacman -S \
		git stow zsh\
		openssh gnupg pinentry\
		alacritty alacritty-terminfo\
		ranger highlight libcaca mediainfo perl-image-exiftool poppler w3m\
		tmux tmuxp\
		i3-wm rofi terminus-font dunst keynav python-pyperclip\
		gvim neovim python-neovim python-black fzf the_silver_searcher netcat prettier\
		fzf fd\
		transmission-gtk mpv libreoffice-fresh zathura zathura-pdf-poppler gpaste htop\
		rsync \
		virtualbox virtualbox-host-modules-arch\
		firefox-developer-edition chromium\
		vimiv flameshot gimp inkscape\
		zeal go\
		pacman-contrib etckeeper reflector

	# not sure about these: weechat acpi

	# Install packages from AUR
	pikaur -S j7-make-config-git polybar buku buku_run-git spotify airvpn-bin mosh-git slack-desktop ngrok
	# Spotify optional deps
	pikaur -S --asdeps ffmpeg-compat-57 zenity
	# note sure about these: postman-bin osync

	# Get misc. rofi scripts
	git clone git@github.com:tadly/rofi-wrapper.git ~/dotfiles/repos/rofi-wrapper

	# Get zimfw
	curl https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh --create-dirs -o ~/.zim/zimfw.zsh

	# Get and install incantation
	cd ~/build && git clone git@git.sr.ht:~thornycrackers/incantation && make incantation && cd ~/dotfiles

	# Link binaries
	ln -s ~/dotfiles/bin ~/.bin

	# Run stow
	cd ~/dotfiles/stow && bash ./install.sh && cd ~/dotfiles

	# These must happen after stow
	# Install zimfw
	source ~/.zim/zimfw.zsh install

	# Enable custom services
	systemctl --user enable gpaste.service
	systemctl --user start gpaste.service
	systemctl --user enable keynav.service
	systemctl --user start keynav.service

uninstall: ## Remove the sumlink
	rm -rf ~/dotfiles/repos/rofi-wrapper
	# TODO
