.DEFAULT_GOAL := help
MAKEFLAGS += --always-make
NVIM_APPNAME = 'dpp_minimal_configuration'

help: ## subcommand list and descriptions.
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

symlink: ## Symlink this repository to `$XDG_CONFIG_HOME/dpp_minimal_configuration`.
	@ln -sv `pwd` ~/.config/$(NVIM_APPNAME)

unlink: ## Unlinking `$XDG_CONFIG_HOME/dpp_minimal_configuration`
	@unlink ~/.config/$(NVIM_APPNAME)

start: ## Start dpp_minimal_configuration with $NVIM_APPNAME.
	@NVIM_APPNAME=$(NVIM_APPNAME) nvim
