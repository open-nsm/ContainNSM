.PHONY: default help install pull update

PROG 		= containnsm
VERSION         = 0.1
INSTALL_DIR 	= /usr/local/bin
MAN_DIR 	= /usr/share/man
Q 		= @
REPO            = $(shell grep url .git/config)
bold   		= $(shell tput bold)
underline 	= $(shell tput smul)
normal 		= $(shell tput sgr0)
red		= $(shell tput setaf 1)
yellow	 	= $(shell tput setaf 3)

default: help

help:
	$(Q)echo "$(bold)ContainNSM (v$(VERSION)) installation targets:$(normal)"
	$(Q)echo " $(red)install$(normal)          - Install and configure ContainNSM on the host"
	$(Q)echo " $(red)uninstall$(normal) 	  - Uninstall ContainNSM"
	$(Q)echo " $(red)update$(normal)           - Update code and reinstall ContainNSM"

install:
	$(Q)echo " $(yellow)Installing $(PROG)$(normal)"
	install -o root -g wheel -m 755 containnsm $(INSTALL_DIR)/$(PROG)
	$(Q)echo " $(bold)--> Install directory is$(normal) $(underline)$(INSTALL_DIR)$(normal)"

uninstall:
	$(Q)echo " $(yellow)Uninstalling $(PROG)$(normal)"
	rm -rf $(INSTALL_DIR)/$(PROG)

pull:
	$(Q)echo " $(yellow)Pulling latest code from:$(normal) $(underline)$(REPO)$(normal)"
	$(Q)git checkout master 1>/dev/null 2>/dev/null
	$(Q)git pull

update: pull
	$(Q)echo " $(yellow)Installing latest code$(normal)"
	make install
