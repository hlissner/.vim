DIR=`pwd -P`

all: install

install:
	@[ -f "$(HOME)/.vim/autoload/plug.vim" ] || curl -fLo $(HOME)/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	@[ -f "$(HOME)/.vimrc" ]  || ln -svf $(DIR)/vimrc ~/.vimrc
	@[ -f "$(HOME)/.gvimrc" ] || ln -svf $(DIR)/gvimrc ~/.gvimrc
	@vim +PlugInstall +qall

neovim:
	@[ -e "$(HOME)/.config/nvim" ] || { mkdir -p $(HOME)/.config; ln -svf $(DIR) $(HOME)/.config/nvim; }
	@[ -e "$(DIR)/init.vim" ] || ln -svf $(DIR)/nvimrc $(DIR)/init.vim

update:
	@vim +PlugUpdate +qall
