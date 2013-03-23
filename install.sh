#!/usr/bin/env bash

VIMHOME="$HOME/.vim"

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
if [ ! -d $VIMHOME/.git ]; then
    if [ -d "$VIMHOME" ]; then
        rm -rf "$VIMHOME"
    fi

    echo "==> Installing vim"
    git clone https://github.com/hlissner/mlvim.git "$VIMHOME"
    mkdir "$VIMHOME/bundle"
    mkdir -p "$VIMHOME/tmp/views" "$VIMHOME/tmp/yankring" "$VIMHOME/tmp/undo"
else
    echo "==> Updating mlvim"
    cd "$VIMHOME" && git pull
fi

cd "$VIMHOME"

# Install vundle
if [ ! -e $VIMHOME/bundle/vundle ]; then
    echo "==> Installing Vundle"
    git clone https://github.com/gmarik/vundle.git "$VIMHOME/bundle/vundle"
    git clone https://github.com/tomasr/molokai.git "$VIMHOME/bundle/molokai"
fi

# Setup links
echo "==> Setting up symlinks"
lnfile $VIMHOME/vimrc $HOME/.vimrc
lnfile $VIMHOME/vimrc.bundles $HOME/.vimrc.bundles
lnfile $VIMHOME/gvimrc $HOME/.gvimrc

echo "==> Updating vim plugins"
vim +BundleInstall! +BundleClean +qall

# YCM
YCMDIR="$VIMHOME/bundle/YouCompleteMe"
if [ -d "$YCMDIR" ] && [ ! -e "$YCMDIR/python/ycm_core.so" ]; then
    echo "==> Trying to compile YCM"
    if ! command -v "cmake" 2>&1 >/dev/null; then
        echo "Cmake is required. Please install it!"
        echo "Then you can compile YCM by running this:"
        echo "   cd ~/.vim/bundle/YouCompleteMe"
        echo "   ./install.sh --clang-completer"
    else
        cd "$YCMDIR"
        ./install.sh --clang-completer
    fi
fi

echo "==> Done!"
