EXCLUDES := .DS_Store .git .gitignore .gitmodules
DOTPATH  := $(realpath $(dir $(lastword $(MAKEFILE_LIST))))
DOTFILES := $(filter-out $(EXCLUDES), $(wildcard .??*))
DORDIRS  := $(filter-out $(EXCLUDES), $(notdir $(wildcard config/*)))
DEPLOYED := $(FILES) $(addprefix .config/, $(DORDIRS))

DEFAULT:

list:
	@echo "To be deployed to $(HOME):"
	@$(foreach file, $(DEPLOYED), echo $(file);)

deploy:
	@if [ ! -d ~/.config ]; then \
		mkdir ~/.config; \
	 fi
	@$(foreach file, $(DOTFILES), ln -sfnv $(abspath $(file)) ~/$(file);)
	@$(foreach file, $(DORDIRS),  ln -sfnv $(abspath $(file)) ~/.config/$(file);)

init:
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/init/initialize.sh

install: deploy init

update:
	@git pull origin master
	@git submodule init
	@git submodule update
	@git submodule foreach git pull origin master
	@echo "Update some plugins..."
	@myupdate

clean:
	@echo "Clean up dotfiles..."
	@$(foreach link, $(DOTFILES), unlink ~/$(link);)
	@$(foreach link, $(DORDIRS),  unlink ~/.config/$(link);)
	@rm -irf $(DOTPATH)

# help:
#  	TODO: help message
