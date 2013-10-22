#!/bin/bash

echo "Let's install vim!"

if ! command -v git 2>&1 >/dev/null; then
    echo "Madness! Git isn't installed!"
    exit 1
fi

if [ ! -d ~/.vim ]; then
    echo "Cloning vim dotfiles..."
    git clone https://github.com/hlissner/vim ~/.vim
fi

if [ ! -d ~/.vim/bundle/neobundle.vim ]; then
    echo "Cloning neobundle..."
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

echo "Writing symlinks..."
ln -sf ~/.vim/vimrc ~/.vimrc
ln -sf ~/.vim/gvimrc ~/.gvimrc
ln -sf ~/.vim/vimrc.bundles ~/.vimrc.bundles
ln -sf ~/.vim/ycm_extra_conf.py ~/.ycm_extra_conf.py

echo "Done! Don't forget to run :NeoBundleInstall and compile YCM"
