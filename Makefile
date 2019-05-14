help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install the symlink
	# TODO: install packages
	# stow 
	# ranger highlight libcaca mediainfo perl-image-exiftool poppler w3m
	# gnupg pinentry git
	# zsh 
	# neomutt
	# tmux tmuxp
	# i3-wm
	# alacritty alacritty-term-info
	# gvim
	# fzf fd
	# TODO Install packages from AUR: j4-make-config polybar rofi buku_run-git osync
	git clone git@github.com:tadly/rofi-wrapper.git ~/dotfiles/repos/rofi-wrapper
	# TODO: install zimfw

uninstall: ## Remove the sumlink
	rm -rf ~/dotfiles/repos/rofi-wrapper
