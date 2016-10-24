DIR=`pwd -P`

all: install

install:
	@[ -f "$(HOME)/.vimrc" ]  || ln -svf $(DIR)/vimrc ~/.vimrc
	@[ -f "$(HOME)/.gvimrc" ] || ln -svf $(DIR)/gvimrc ~/.gvimrc
	@vim +PlugInstall +qall

update:
	@vim +PlugUpdate +qall
