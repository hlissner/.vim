# Vim
[![MIT](https://img.shields.io/badge/license-MIT-green.svg)](./LICENSE)

In the terminal, remotely--wherever GUI [emacs] isn't an option, vim is my lean,
mean weapon of choice. For everything from web and gamedev, to arduino and
machine learning.

![mlvim](https://dl.dropboxusercontent.com/u/2908279/public/vimrc.png)

It strives for consistency with [my emacs+evil config][emacs] to minimize
context switch as I jump between them.

## Installation

```bash
git clone https://github.com/hlissner/.vim ~/.vim
cd ~/.vim
make install    # installs vim-plug + sets up symlinks + installs plugins
make neovim     # ...if you use neovim
```

## Will this work on Windo—

![Windows, you say...](http://i3.kym-cdn.com/photos/images/newsfeed/000/549/293/504.gif)


[emacs]: https://github.com/hlissner/.emacs.d
