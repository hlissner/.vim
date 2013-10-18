# My Little Vim

![mlvim](https://dl.dropboxusercontent.com/u/2908279/public/vimrc.png)

These are my weapons. Anything unix based will love it, like a chocolate covered smore
wrapped in baconstrips. Only fellow spaghetti code warriors need apply. Masochists are
welcome too (as if they aren't the same thing).

It wubs everything from web design (html, css, scss/less, js, jquery, coffeescript), to
web dev (php, ruby/rails, python), to game and app dev (lua/love2D, Csharp+Mono, C++,
Go) and then some (markdown and plantuml).

# Installation
So, you're running...
## Mac / Linux
Fantastic! Install gvim or [macvim](https://code.google.com/p/macvim/). On mac, I'd recommend
[homebrew](http://mxcl.github.com/homebrew/):

    brew install macvim --devel
    # or
    brew install vim --with-ruby --with-python

If you're on linux, you're smarter than the average bear. Good luck!

With [mac|g]vim installed, whisper these words into the ear of your console (nicely, it
has feelings):

    git clone https://github.com/hlissner/vim ~/.vim
    git clone https://github.com/Shougo/neobundle.vim "$VIMHOME/bundle/neobundle.vim"
    ln -s ~/.vim/vimrc ~/.vimrc
    ln -s ~/.vim/vimrc.bundles ~/.vimrc.bundles
    ln -s ~/.vim/gvimrc ~/.gvimrc
    vim +NeoBundleInstall! +qall

GLORIOUS.

## What about Windo—

![Windows, you say...](http://i3.kym-cdn.com/photos/images/newsfeed/000/549/293/504.gif)

# That's all!

Now get back to work.
