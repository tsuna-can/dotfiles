.PHONY: all
all:
	@echo "Please specify a target"

.PHONY: install-zsh
install-zsh:
	sudo apt install zsh
	chsh -s /usr/bin/zsh

# On Raspberry Pi, to install latest nvim, use snapd
.PHONY: install-nvim-snapd
install-nvim-snapd:
	sudo apt install snapd
	sudo snap install nvim --classic

.PHONY: link-nvim
link-nvim:
	ln -fsv ${PWD}/.config/nvim ${HOME}/.config/nvim

.PHONY: install-sdkman
install-sdkman:
	curl -s "https://get.sdkman.io" | bash
	source "${HOME}/.sdkman/bin/sdkman-init.sh"

.PHONY: mac-config
mac-config:
	defaults write -g KeyRepeat -int 1
	defaults write -g InitialKeyRepeat -int 13

.PHONY: link
link:
	sudo chmod +x ./link.sh
	./link.sh

# Setup for Mac
.PHONY: setup-mac
setup-mac: install-sdkman mac-config link

# Setup for Raspberry Pi
.PHONY: setup-raspberrypi
setup-raspberrypi: install-zsh install-nvim-snapd link-nvim

