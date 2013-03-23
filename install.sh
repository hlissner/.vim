#!/usr/bin/env bash

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

echo "[My Little Vim]"

# Install/update mlvim
if [ ! -e $VIMDIR/.git ]; then
    echo "==> Installing vim"
    
    if [ -d $VIMDIR ]; then
        rm -rf $VIMDIR
    fi

    git clone https://github.com/hlissner/mlvim $VIMDIR
    mkdir $VIMDIR/tmp $VIMDIR/bundle
    mkdir $VIMDIR/tmp/views $VIMDIR/tmp/yankring $VIMDIR/tmp/undo
else
    echo "==> Updating mlvim"
    cd ~/.vim && git pull
fi

# Install vundle
if [ ! -e $VIMDIR/bundle/vundle ]; then
    echo "==> Installing Vundle"
    git clone https://github.com/gmarik/vundle $VIMDIR/bundle/vundle
    git clone https://github.com/tomasr/molokai $VIMDIR/bundle/molokai
fi

# Setup links
echo "==> Setting up symlinks"
lnfile $VIMDIR/vimrc $HOME/.vimrc
lnfile $VIMDIR/vimrc.bundles $HOME/.vimrc.bundles
lnfile $VIMDIR/gvimrc $HOME/.gvimrc

echo "==> Updating vim plugins"
vim +BundleInstall! +BundleClean +qall

# YCM
YVM_DIR="$VIMDIR/bundle/YouCompleteMe"
if [ -d "$YCM_DIR" ] && [ ! -e "$YCM_DIR/python/ycm_core.so" ]; then
    echo "==> Trying to compile YCM"
    if ! command -v "cmake" 2>&1 >/dev/null; then
        echo "Cmake is required. Please install it!"
        echo "Then you can compile YCM by running this:"
        echo "   cd ~/.vim/bundle/YouCompleteMe"
        echo "   ./install.sh --clang-completer"
    else
        cd ~/.vim/bundle/YouCompleteMe
        ./install.sh --clang-completer
    fi
fi

echo "==> Done!"
