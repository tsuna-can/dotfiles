.PHONY: all
all:
	@echo "Please specify a target"

.PHONY: link-nvim
link-nvim:
	ln -fsv ${PWD}/.config/nvim ${HOME}/.config/nvim

.PHONY: install-sdkman
install-sdkman:
	curl -s "https://get.sdkman.io" | bash
	source "${HOME}/.sdkman/bin/sdkman-init.sh"

.PHONY: mac-config
mac-config:
	chmod +x ./macos.sh
	./macos.sh

.PHONY: link-ghostty
link-ghostty:
	chmod +x ./ghostty/link.sh
	./ghostty/link.sh

.PHONY: link-starship
link-starship:
	chmod +x ./starship/link.sh
	./starship/link.sh

.PHONY: link-sheldon
link-sheldon:
	chmod +x ./sheldon/link.sh
	./sheldon/link.sh

.PHONY: link
link: link-ghostty link-starship link-sheldon
	sudo chmod +x ./link.sh
	./link.sh

# Setup for Mac
.PHONY: setup-mac
setup-mac: install-sdkman mac-config link
