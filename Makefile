DIR=`pwd -P`
VIM="vim"
VIMRC_SRC := "$(DIR)/init.vim"
VIMRET := $(shell nvim --version 1>&2 >/dev/null; echo $$?)
ifeq ($(VIMRET), 0)
	VIMRC := "/dev/null"
	VIMDIR := "$(HOME)/.config/nvim"
	VIM="nvim"
else
	VIMRC := "$(HOME)/.vimrc"
	VIMDIR := "$(HOME)/.vim"
endif

#
all: install

install:
	@mkdir -p "$(HOME)/.config"
	@[ -e "$(VIMRC)" ] || ln -svf "$(VIMRC_SRC)" "$(VIMRC)"
	@[ -d "$(VIMDIR)" ] || ln -svf "$(DIR)" "$(VIMDIR)"
	@[ -f "$(DIR)/autoload/plug.vim" ] || curl -fLo $(DIR)/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@$(VIM) +PlugInstall +qall

update:
	@$(VIM) +PlugUpdate +qall
