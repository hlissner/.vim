#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Linking vim distro to home"
for f in .vimrc .gvimrc .vim; do 
    [ -e "$HOME/$f" ] || ln -s "$DIR/$f" "$HOME/$f"
done

mkdir -p $HOME/.vim/bundle

echo "Installing Vundle"
git clone http://github.com/gmarik/vundle.git $HOME/.vim/bundle/vundle

echo "Installing Vundle plugins!"
vim +BundleInstall! +BundleClean +q
