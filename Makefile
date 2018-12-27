EXCLUDES := .DS_Store .git .gitignore .gitmodules
DOTPATH  := $(CURDIR)
DOTFILES := $(filter-out $(EXCLUDES), $(wildcard .??*))
XDGCONFS := $(filter-out $(EXCLUDES), $(notdir $(wildcard config/*)))
VSCODE   := $(notdir $(wildcard vscode/*.json))
DEPLOYED := $(DOTFILES) $(addprefix .config/, $(XDGCONFS))

DEFAULT:

list:
	@echo "To be deployed to $(HOME):"
	@$(foreach file, $(DEPLOYED), echo $(file);)

deploy:
	@if [ ! -d ~/.config ]; then \
		mkdir ~/.config; \
	 fi
	@$(foreach file, $(DOTFILES), ln -sfnv $(abspath $(file)) ~/$(file);)
	@$(foreach conf, $(XDGCONFS), ln -sfnv $(abspath config/$(conf)) ~/.config/$(conf);)
	@$(foreach json, $(VSCODE),   ln -sfnv $(abspath vscode/$(json)) ~/Library/Application\ Support/Code/User/$(json);)

init:
	@DOTPATH=$(DOTPATH) bash $(DOTPATH)/init/initialize.sh

install: deploy init

update:
	@git pull origin master
	@git submodule init
	@git submodule update
	@git submodule foreach git pull origin master
	@echo 'Update other plugins...'
	@myupdate

clean:
	@echo 'Clean up dotfiles...'
	@$(foreach link, $(DEPLOYED), unlink ~/$(link);)
	@rm -rfi $(DOTPATH)

help:
	@echo 'list     List up dotfiles which will be deployed'
	@echo 'init     Initialize macOS environment'
	@echo 'deploy   Deploy dotfiles'
	@echo 'install  Initialize and deploy'
	@echo 'update   Update repository, submodules and other plugins'
	@echo 'help     Display targets in Makefile'
