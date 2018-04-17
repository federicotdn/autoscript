SCRIPT_NAME=autoscript
INSTALL_PATH=/usr/local/bin

check:
	@shellcheck $(SCRIPT_NAME) -e SC2181

install:
	sudo install $(SCRIPT_NAME) $(INSTALL_PATH)

uninstall:
	sudo rm $(INSTALL_PATH)/$(SCRIPT_NAME)

install_bashrc:
	echo "autoscript record && exit; true" >> ~/.bashrc