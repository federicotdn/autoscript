SCRIPT_NAME=autoscript

check:
	@shellcheck bin/$(SCRIPT_NAME)
