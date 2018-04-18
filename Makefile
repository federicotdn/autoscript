SCRIPT_NAME=autoscript
INSTALL_PATH=/usr/local/bin

check:
	@shellcheck bin/$(SCRIPT_NAME) -e SC2181
