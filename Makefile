help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

install: ## Install the symlink
	# TODO: install packages
	# sudo pacman -S stow
	git clone git@github.com:tadly/rofi-wrapper.git ~/dotfiles/repos/rofi-wrapper
	# TODO: install zimfw

uninstall: ## Remove the sumlink
	rm -rf ~/dotfiles/repos/rofi-wrapper
