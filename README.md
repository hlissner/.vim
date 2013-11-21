# My Little Vim

![mlvim](https://dl.dropboxusercontent.com/u/2908279/public/vimrc.png)

My weapon of choice.

For web design (html, css/scss, js, jquery, php, python, ruby/ror), gamedev (lua/love2D,
pySFML/pyGame, C++), and then some (markdown, plantuml).

# Installation
## Mac / Linux
You need gvim or [macvim](https://code.google.com/p/macvim/). On mac, I'd recommend you
use [homebrew](http://mxcl.github.com/homebrew/) to install it:

    brew install macvim --devel
    # or
    brew install vim --with-ruby --with-python

If you're on linux, you're smarter than the average bear and can figure it out yourself!

With [mac|g]vim installed, whisper these words into the ear of your console (nicely, it
has feelings):

    git clone https://github.com/hlissner/vim ~/.vim
    ln -s ~/.vim/vimrc ~/.vimrc
    vim +NeoBundleInstall! +qall

GLORIOUS.

## What about Windo—

![Windows, you say...](http://i3.kym-cdn.com/photos/images/newsfeed/000/549/293/504.gif)

Now get back to work.
