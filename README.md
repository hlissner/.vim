
# My Little Vim

![mlvim](http://n4s.co/mlvim.png)

mlvim is a distribution of vim plugins, resources and settings managed with
[Vundle](https://github.com/gmarik/vundle).

(Warning: Your mileage on windows may vary)

**Vim needs to be built with ruby and python for some of these plugins (though
they will disable themselves otherwise).**

## Installation
Just do the following (this assumes you want vim in your $HOME):

    git clone https://github.com/hlissner/mlvim ~/.vim
    git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle

And if you'd like my Ultisnip snippets:

    git clone https://github.com/hlissner/vim-ultisnips-snippets ~/.vim/snippets

**Note:** Ultisnips is configured to search for a 'snippets' folder and won't
index the default ones that come with Ultisnips! You can change this in vimrc.

## Plugins

- [Bundles](#bundles)
    - [Ack](#ack)
    - [CtrlP](#ctrlp)
    - [NERDTree](#nerdtree)
    - [PickAColor](#pickacolor)
    - [Powerline](#powerline)
    - [Syntastic](#syntastic)
    - [Tabular](#tabular)
    - [Tagbar](#tagbar)
    - [YankRing](#yankring)
    - [bufkill](#bufkill)
    - [delimitMate](#delimitmate)
    - [tcomment](#tcomment)
    - [ultisnips](#ultisnips)
    - [vim-easytags](#vim-easytags)
    - [vim-endwise](#vim-endwise)
    - [vim-fugitive](#vim-fugitive)
    - [vim-indent-guides](#vim-indent-guides)
    - [vim-preview](#vim-preview)
    - [vim-repeat](#vim-repeat)
    - [vim-surround](#vim-surround)
    - [vim-unimpaired](#vim-unimpaired)
    - [vim-speeddating](#vim-speeddating)
    - [vim-multiedit](#vim-multiedit)
- [Additional Syntaxes](#additional-syntaxes)
- [For the mac](#for-the-mac)

### Ack
How do you search your files? What's that? Not with Ack? Well there's your
problem! 

    :Ack [options] {pattern} [{directory}]

In the quickfix window:

    o    to open (same as enter)
    go   to preview file (open but maintain focus on ack.vim results)
    t    to open in new tab
    T    to open in new tab silently
    v    to open in vertical split
    gv   to open in vertical split silently
    q    to close the quickfix window

Where you would use :grep, :grepadd, :lgrep, or :lgrepadd, you use :Ack,
:AckAdd, :LAck, and :LAckAdd respectively.

([source](https://github.com/mileszs/ack.vim))

### CtrlP
If you've ever used textmate, sublime text 2, PeepOpen or the CommandT plugin
for vim - you know a fraction of what CtrlP does. Best of all, it's written
entirely in VimL!

![CtrlP paired with Powerline](https://a248.e.akamai.net/camo.github.com/63f9947cac196ec7e6e3d790fd3cd1e1463a7b9b/687474703a2f2f692e696d6775722e636f6d2f4d737549422e706e67)

It lets you fuzzy-find files, through your most-recently-used files, searchs
lines in all open buffers, and more.

    <leader>tt OR <D-t> (CMD+T)

    Command                             Fuzzy searching...:
    ----------------------------------------------------------------------------
    <leader>tb :CtrlPBuffer             between open buffers
    <leader>tr :CtrlPTag                tags
    <leader>tm :CtrlPMRU                through recently opened files
    <leader>tl :CtrlPLine               lines in open buffers
    <leader>tc :CtrlPChangeAll          changes in all open buffers 
    <leader>tc. :CtrlPChange            changes in current buffer

([source](https://github.com/kien/ctrlp.vim))

### NERDTree
The NERD tree allows you to explore your filesystem and to open files and
directories. It presents the filesystem to you in the form of a tree which you
manipulate with the keyboard and/or mouse. It also allows you to perform simple
filesystem operations.

    <leader>n           Opens NERDTree
    <leader>N           Opens NERDTree and focuses on current file

([source](https://github.com/scrooloose/nerdtree))

### PickAColor
Four commands that bring up the OS color picker; great in combination with
Colorizer.

    :PickHEX
    :PickHSL
    :PickRGB
    :PickRAW

### Powerline
An better-looking, more functional status line for vim. Compatible with many of
the plugins here.

![The different modes of
powerline](https://a248.e.akamai.net/camo.github.com/63f9947cac196ec7e6e3d790fd3cd1e1463a7b9b/687474703a2f2f692e696d6775722e636f6d2f4d737549422e706e67)

In this distro I've shorted all the mode labels to one or two characters ("I",
"V", etc) - I do love my minimalism.

([source](https://github.com/Lokaltog/vim-powerline))

### Syntastic
A plugin that does syntax checks when you save your code. If it finds errors,
it'll list them in a quickfix window with line numbers and everything - hover
over them, press enter and it'll jump you to where it is. It'll also mark
offending lines in the code directly!

Very useful, and I've applied a few extra setting to make working with PHP
a little more bearable. It also works for SASS/SCSS.

([source](https://github.com/scrooloose/syntastic))

### Tabular
Things should line up. When they don't, we become green, toss keyboards through
windows and generally wreck havoc on the unsuspecting masses. We can't have
that, so... presenting Tabular!

This distro comes with:

    <leader>a= :Tabularize /=
    <leader>a= :Tabularize /=
    <leader>a: :Tabularize /:
    <leader>a: :Tabularize /:
    <leader>a:: :Tabularize /:\zs
    <leader>a:: :Tabularize /:\zs
    <leader>a, :Tabularize /,
    <leader>a, :Tabularize /,
    <leader>a<Bar> :Tabularize /<Bar>
    <leader>a<Bar> :Tabularize /<Bar>

A short demonstration: running :Tabularize /= will make

    $varOne = 5;
    $myOtherVar = "Hello";
    $anotherVarOfDoom = "World";

into

    $varOne           = 5;
    $myOtherVar       = "Hello";
    $anotherVarOfDoom = "World";

([source](https://github.com/godlygeek/tabular))

### Tagbar
"Tagbar is a vim plugin for browsing the tags of source code files."

Need I say more?

([source](https://github.com/majutsushi/tagbar))

### YankRing
Keeping track of everything you yank, delete or change; basically a fancy
clipboard manager for vim. You can use <C-n> and <C-p> to switch between yanks,
or you can outright use <leader>p and choose which one you want.

([source](https://github.com/vim-scripts/YankRing.vim))

### bufkill
Offers a few helpful functions for handling buffers (i.e. unloading, deleting
or wiping them) without affecting the window layout.

    <leader>bd      Delete the current buffer, but preserves window layout

Check the source for more functionality:

([source](https://github.com/vim-scripts/bufkill.vim))

### delimitMate
Auto-inserts closing quotes, parenthesis, brackets, etc. This just makes insert
mode a whole lot nicer.

([source](https://github.com/Raimondi/delimitMate))

### tcomment
There's also NERDCommenter, but I chose tcomment because of more vim-natural
movement controls and text object awareness. For instance, I can't do gciw to
comment a word in NERDCommenter.

By default, gcc comments out a line, but I've also mapped the following to do
so:

    map <leader>/
    imap <D-/>

([source](https://github.com/tomtom/tcomment_vim))

### ultisnips
So why not SnipMate? For one, it's nice having fewer dependencies - but that's
a minor quip. UltiSnip is more powerful, especially with the ability to embed
ruby, python or VimL into the snippets.

For this distro I've assigned <Tab> as the snippet expansion trigger, and <Tab>
/ <S-Tab> can be used to jump between markers.

([source](https://github.com/SirVer/ultisnips))

### vim-easytags
Something to autogenerate my tags. What can I say? I'm lazy.

([source](https://github.com/xolox/vim-easytags))

### vim-endwise
Auto completes block structures, like if, do, and def blocks, by adding the
"end" after it. Also works with VimL's endfunction/endif/etc and a few others.

([source](https://github.com/tpope/vim-endwise))

### vim-fugitive
"I'm not going to lie to you; fugitive.vim may very well be the best Git
wrapper of all time."

Amen.

    <leader>gs :Gstatus
    <leader>gd :Gdiff
    <leader>gc :Gcommit
    <leader>gb :Gblame
    <leader>gl :Glog
    <leader>gp :Git push

([source](https://github.com/tpope/vim-fugitive))

### vim-indent-guides
Adds a nice, subtle highlight to show indent levels. I find it works best with
soft tabs, which is active in this distro.

You can toggle indent guides using:

    <leader>ig

([source](https://github.com/nathanaelkane/vim-indent-guides))

### vim-preview
Tools to preview markup files like markdown, rdoc, textile and rst while
you're editing them, by compiling them into html and opening them in your
browser.

    <leader>P   Open preview in browser

([source](https://github.com/spf13/vim-preview))

### vim-repeat
Most (if not all) plugins don't seem to work well with <code>.</code> when it
comes to repeating actions. This plugin tries to fix that.

([source](https://github.com/tpope/vim-repeat))

### vim-surround
One of the most **important** plugins in my arsenal. It's all about changing
"surroundings": parenthesis, brackets, quotes, tags, and more. [Tim Pope explains it
better](https://github.com/tpope/vim-surround).

([source](https://github.com/tpope/vim-surround))

### vim-unimpaired
Adds a slew of helpful key maps. Here are just a few of them:

    [b          :bprevious
    ]b          :bnext
    [o          Previous file in current file's directory (alphabetical)
    ]o          Next file in current file's directory
    [n          Previous SCM conflict marker
    ]n          Next SCM conflict marker
    [<Space>    Add [count] blank lines above cursor
    ]<Space>    Add [count] blank lines below cursor
    [e          Exchange current line with [count] lines above it
    ]e          Exchange current line with [count] lines below it

Check out the docs for more.

([source](https://github.com/tpope/vim-unimpaired))

### vim-speeddating

Allows you to deal with date and time formats with ease. For example:

    <C-A>   Increment
    <C-X>   Decrement
    d<C-A>  Sets timestamp under cursor to current time

([source](https://github.com/tpope/vim-speeddating))

### vim-multiedit

Do you envy Sublime Text for it's multiple selection editing? Welp, this plugin
tries its best to provide the same.

([source](https://github.com/hlissner/vim-multiedit))

## Additional Syntaxes
* [Markdown](https://github.com/spf13/vim-markdown)
* [Blade](http://laravel.com/docs/views/templating) ([Laravel](http://laravel.com/)'s templating engine)
* [PHP Twig](http://twig.sensiolabs.org/)
* [Jade](http://jade-lang.com)
* [SASS/SCSS](http://sass-lang.com/)
* [LESS](http://lesscss.org/)

## For the mac
In .gvimrc, I've added a four keyboard shortcuts:

    <leader>of      Reveals the current file in finder
    <leader>ol      Sends the current file to launchbar
    <leader>ot      Opens iTerm and cd's to this file's directory
    <leader>ou      Send current file to Transmit (for docksend)

**Note**: send-to-transmit is intelligent with sass, less and stylus
stylesheets. It will look for a compiled css file in ../css and send that to
transmit instead of the source file.

Check the .gvimrc file for other mac-specific shortcuts.

# Good luck!
