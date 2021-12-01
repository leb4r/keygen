ARTIFACTS_DIR := $(CURDIR)/artifacts
SHELL := /bin/bash

DEFAULT_HELP_TARGET ?= help/short
HELP_FILTER ?= .*

default:: $(DEFAULT_HELP_TARGET)
	@exit 0

-include tasks/Makefile.*

## Create artifacts directory
artifacts:
	mkdir -p $(ARTIFACTS_DIR)

## Help screen
help:
	@printf "Available targets:\n\n"
	@make -s help/generate | grep -E "\w($(HELP_FILTER))"

## Display help for all targets
help/all:
	@printf "Available targets:\n\n"
	@make -s help/generate

## This help short screen
help/short:
	@printf "Available targets:\n\n"
	@make -s help/generate MAKEFILE_LIST="Makefile"

# Generate help output from MAKEFILE_LIST
help/generate:
	@awk '/^[a-zA-Z_0-9%:\\\/-]+:/ { \
	  helpMessage = match(lastLine, /^## (.*)/); \
	  if (helpMessage) { \
	    helpCommand = $$1; \
	    helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
      gsub("\\\\", "", helpCommand); \
      gsub(":+$$", "", helpCommand); \
	    printf "  \x1b[32;01m%-35s\x1b[0m %s\n", helpCommand, helpMessage; \
	  } \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST) | sort -u
	@printf "\n"
