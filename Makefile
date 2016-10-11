all: install

install:
	@vim +PlugInstall +qall

update:
	@vim +PlugUpdate +qall
