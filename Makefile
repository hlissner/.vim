DIR=`pwd -P`
VIMRC_SRC := "$(DIR)/init.vim"
VIMRET := $(shell nvim --version 1>&2 >/dev/null; echo $$?)
ifeq ($(VIMRET), 0)
	VIMRC := "/dev/null"
	VIMDIR := "$(HOME)/.config/nvim"
else
	VIMRC := "$(HOME)/.vimrc"
	VIMDIR := "$(HOME)/.vim"
endif

#
all: install

install:
	@[ -e "$(VIMRC)" ] || ln -svf "$(VIMRC_SRC)" "$(VIMRC)"
	@[ -d "$(VIMDIR)" ] || { mkdir -p "$(VIMDIR)"; ln -svf "$(DIR)" "$(VIMDIR)"; }
	@[ -f "$(DIR)/autoload/plug.vim" ] || curl -fLo $(HOME)/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@vim +PlugInstall +qall

update:
	@vim +PlugUpdate +qall
