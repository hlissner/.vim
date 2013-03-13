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

command -v git >/dev/null 2>&1 || { 
    echo >&2 "Git wasn't found and is required."; 
    exit 1; 
}

command -v curl >/dev/null 2>&1 || { 
    echo >&2 "Curl wasn't found and is required."; 
    exit 1; 
}

echo "\n* My Little Vim"

# Install/update mlvim
if [ ! -e $VIMDIR/.git ]; then
    echo "\n* Installing mlvim"
    git clone https://github.com/hlissner/mlvim ~/.vim
    mkdir $VIMDIR/tmp $VIMDIR/bundle
    mkdir $VIMDIR/tmp/views $VIMDIR/tmp/yankring $VIMDIR/tmp/undo
else
    echo "\n* Updating mlvim"
    cd ~/.vim && git pull
fi

echo "\n* Setting up symlinks..."
lnfile $VIMDIR/vimrc $HOME/.vimrc
lnfile $VIMDIR/vimrc.bundles $HOME/.vimrc.bundles
lnfile $VIMDIR/gvimrc $HOME/.gvimrc

# Install vundle
if [ ! -e $VIMDIR/bundle/vundle ]; then
    echo "\n* Installing Vundle"
    git clone https://github.com/gmarik/vundle $HOME/.vim/bundle/vundle
    git clone https://github.com/tomasr/molokai ~/.vim/bundle/molokai
fi

echo "\n* Updating vim plugins"
vim +BundleInstall! +BundleClean +qall

echo "\n* Trying to compile YCM"
cd ~/.vim/bundle/YouCompleteMe
./install.sh --clang-completer

echo "\n* Done! Don't forget to compile YCM!"
