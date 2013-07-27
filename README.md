
# My Little Vim

![mlvim](http://i.imgur.com/50dYqoM.png)

This is my little vim distro for my mac, windows and linux machines, and for any
of my fellow spaghetti code warriors (aka masochists). 

It's got stuff for everything from web design (html, css, scss/less, js,
jquery, coffeescript), to web dev (php, ruby/rails, python), to game and app
dev (lua/love2D, Csharp+Mono, C++, Go) and some extras (markdown and plantuml).

It has some nifty extra plugins, like
[CtrlP](https://github.com/kien/ctrlp.vim) and
[SuperTab](https://github.com/ervandew/supertab). Check out the bundles folder
for more!

# Installation
## Mac
Install [macvim](https://code.google.com/p/macvim/). On a mac, I'd recommend
[homebrew](http://mxcl.github.com/homebrew/), then all you need is:

    brew install macvim
    # or
    brew install vim --with-ruby --with-python

## Mac & Linux

With [mac|g]vim installed, copy and paste the following:

    git clone https://github.com/hlissner/vim.git ~/.vim
    git clone https://github.com/gmarik/vundle.git "$VIMHOME/bundle/vundle"
    git clone https://github.com/tomasr/molokai.git "$VIMHOME/bundle/molokai"
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/vimrc.bundles ~/.vimrc.bundles
    ln -s ~/.vim/gvimrc ~/.gvimrc
    vim +BundleInstall! +BundleClean +qall

And don't forget to run :BundleInstall in vim. Then you're good to go!

## Windows

This distro works great out of the box in Windows, except you'll need Cygwin
installed for vim to take advantage of the bash shell. Otherwise, just change
(or remove) the set shell=... line in vimrc.

# Welp!

That's all folks! Good luck fellow masochists!
