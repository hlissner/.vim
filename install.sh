[ ! -d ~/.vim/bundle/neobundle.vim ] && git clone --recursive https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

ln -s ~/.vim/vimrc ~/.vimrc
ln -s ~/.vim/gvimrc ~/.gvimrc

# Fix an issue with C-h registering as BS in NeoVim
infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
tic $TERM.ti
rm -f $TERM.ti
