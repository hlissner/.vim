#!/bin/bash

VIMDIR="$HOME/.vim"

lnfile() {
    if [ ! -e $2 ]; then
        ln -s $1 $2
    fi
    if [ -L $2 ]; then
        ln -sf $1 $2
    fi
}

# Go!
echo "[My Little Vim]"

command -v git >/dev/null 2>&1 || { 
    echo >&2 "Git wasn't found and is required."; 
    exit 1; 
}

# Install/update mlvim
if [ ! -e $VIMDIR/.git ]; then
    echo "Installing mlvim..."
    git clone https://github.com/hlissner/mlvim ~/.vim
    mkdir $VIMDIR/tmp $VIMDIR/bundle
else
    echo "Updating mlvim..."
    cd ~/.vim && git pull
fi

echo "Setting up symlinks..."
lnfile $VIMDIR/vimrc $HOME/.vimrc
lnfile $VIMDIR/gvimrc $HOME/.gvimrc

# Install vundle
if [ ! -e $VIMDIR/bundle/vundle ]; then
    echo "Installing Vundle..."
    git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle
fi

if [ ! -e $VIMDIR/snippets/.git ]; then
    echo "Installing snippets..."
    git clone https://github.com/hlissner/vim-ultisnips-snippets $HOME/.vim/snippets
fi

echo "Updating vim plugins"
vim -u ~/.vimrc +BundleInstall! +BundleClean +qall

echo "Done!"
