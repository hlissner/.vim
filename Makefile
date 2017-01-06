DIR=`pwd -P`

all: install

install:
	@[ -f "$(HOME)/.vimrc" ]  || ln -svf $(DIR)/vimrc ~/.vimrc
	@[ -f "$(HOME)/.gvimrc" ] || ln -svf $(DIR)/gvimrc ~/.gvimrc
	@vim +PlugInstall +qall

neovim:
	@[ -e "$(HOME)/.config/nvim" ] || { mkdir -p $(HOME)/.config; ln -svf $(DIR) $(HOME)/.config/nvim; }

update:
	@vim +PlugUpdate +qall
