
# My Little Vim

![mlvim](http://i.imgur.com/50dYqoM.png)

# Installation
## Mac
Install [macvim](https://code.google.com/p/macvim/). On a mac, I'd recommend
[homebrew](http://mxcl.github.com/homebrew/), then all you need is a simple:

    brew install macvim
    # or
    brew install vim --with-ruby --with-python

With [mac]vim installed, copy and paste the following:

    sh <(curl https://raw.github.com/hlissner/mlvim/master/install.sh -L)

And voila! Good to go.

## Linux
You'll need vim (or gvim running vim) 7.3.584 or greater. On ubuntu you'll need
to [compile it
yourself](https://github.com/Valloric/YouCompleteMe/wiki/Building-Vim-from-source).

With that, you'll need ruby, python, cmake, curl and git. Then this is all you
need:

    sh <(curl https://raw.github.com/hlissner/mlvim/master/install.sh -L)

## Windows

At the moment, this won't work well on windows. Stay tuned!

# Plugins

Plugins are managed using [Vundle](https://github.com/gmarik/vundle).

## [Ack]
How do you search your files? What's that? Not with Ack? Well there's your
problem! 

    :Ack [options] {pattern} [{directory}]

This will bring up the quickfix window with a list of files that contain your
query. Here are your weapons:

    o    to open (same as enter)
    go   to preview file (open but maintain focus on ack.vim results)
    t    to open in new tab
    T    to open in new tab silently
    v    to open in vertical split
    gv   to open in vertical split silently
    q    to close the quickfix window

*(Where you would use :grep, :grepadd, :lgrep, or :lgrepadd, you use :Ack,
:AckAdd, :LAck, and :LAckAdd respectively.)*

You're welcome.

## [CtrlP]
If you've ever used textmate, sublime text 2, PeepOpen, the CommandT plugin,
or, well, *programmed*, then you should understand a fraction of what
CtrlP does. Except it's written entirely in VimL (off with ya, ye scurvy
dependencies).

It lets you fuzzy-find files in that fashion. Or through your
most-recently-used files, or fuzzy search lines in all open buffers, and more.

    <leader>. OR <D-t> (CMD+T)          The good ol' fuzzy file finder

    Command                             Fuzzy searching...:
    ----------------------------------------------------------------------------
    <leader>, :CtrlPBuffer              between open buffers
    <leader>tr :CtrlPTag                tags
    <leader>tm :CtrlPMRU                through recently opened files
    <leader>tl :CtrlPLine               lines in open buffers
    <leader>tc :CtrlPChangeAll          changes in all open buffers 
    <leader>tc. :CtrlPChange            changes in current buffer

## [NERDTree]
It's christmas every day when you've got your NERDTree up. It's a file explorer
that replaces netrw, and more! My favorite are the file operations. Press m and
it'll let you create, move, rename, reveal in finder, open in quicklook, etc.

Two more maps I made for convenience:

    <leader>n           Opens NERDTree
    <leader>N           Opens NERDTree and focuses on current file

## [PickAColor]
I need colors, but the OS color picker won't bring itself up!

    :PickHEX
    :PickHSL
    :PickRGB
    :PickRAW

## [PIV]
PHP integration for VIM; a compendium of functionality including: indent,
syntax, auto-complete, phpdocgen, and more.

## [Powerline]
Does your vim status line look sexy? Not sexy enough. Powerline's that better-looking
and sexy neighbor you bought that pair of binoculars for. Is your body ready?

![The different modes of
powerline](https://a248.e.akamai.net/camo.github.com/63f9947cac196ec7e6e3d790fd3cd1e1463a7b9b/687474703a2f2f692e696d6775722e636f6d2f4d737549422e706e67)

In this distro I've shortened the mode labels to one or two characters ("I",
"V", etc) - I do love my minimalism.

## [Syntastic]
A plugin that does syntax checks when you save your code. It's like that
favorite aunt who makes you hot chocolate on cold winter nights, with
marshmellows. Marshmellows!

If it finds errors, it'll list them in a quickfix window with line numbers and
everything - hover over them, press enter and it'll jump you to where it is.
It'll also mark offending lines in the code directly! How offensive.

Very useful, and I've applied a few extra setting to make working with PHP
a little more bearable. It also works for SASS/SCSS.

## [Tabular]
Things should line up. When they don't, we become green, toss keyboards through
windows and wreck havoc onto the unsuspecting masses. We can't have that, so...
presenting Tabular!

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

## [Tagbar]
"Tagbar is a vim plugin for browsing the tags of source code files."

Need I say more?

## [YankRing]
A fancy clipboard manager for vim. Use &lt;C-n&gt; and &lt;C-p&gt; to switch
between yanks, or use &lt;leader&gt;p and choose which one you want from
a list.

Easy.

## [bufkill]
Offers kep maps for handling buffers (i.e. unloading, deleting or wiping them)
without affecting the window layout.

    <leader>bd      Delete the current buffer, but preserves window layout
    <leader>bz      Reopen the last closed buffer (i.e. 'undo')

Check the source for more functionality:

## [delimitMate]
Auto-inserts closing quotes, parenthesis, brackets, etc. This just makes insert
mode a whole lot nicer.

## [tcomment]
There's also NERDCommenter, but I chose tcomment because of it's text object
awareness reminds me how much I love being a nerd. For instance, I can't do
gciw to comment a word in NERDCommenter.

By default, gcc comments out a line, but I've also mapped the following to do
so:

    map <leader>/
    imap <D-/>

## [ultisnips]
There once was a boy named SnipMate, he had friends. Tlib and addon-mw-utils.
I didn't like them because they smelled funny.

Ultisnips has no such dependencies (and it's still in active development last
I checked). But that's a minor quip, the *real* reason? **Power.** UltiSnip
allows you to embed ruby, python or VimL into the snippets.

<del>For this distro I've assigned <Tab> as the snippet expansion trigger, and <Tab>
/ <S-Tab> can be used to jump between markers.</del>

Currently, the plugin YouCompleteMe monopolizes <Tab>, <C-n> and <C-p>. So
Ultisnips is temporarily mapped to:

    <C-tab>   Trigger snippet
    <C-j>     Next snippet marker
    <C-k>     Previous snippet marker

## [vim-easytags]
Something to autogenerate my tags. What can I say? I'm lazy.

## [vim-endwise]
Auto completes block structures, like if, do, and def blocks, by adding the
"end" after it. Also works with VimL's endfunction/endif/etc and a few others.

Did I mention I'm lazy?

## [vim-fugitive]
"I'm not going to lie to you; fugitive.vim may very well be the best Git
wrapper of all time."

Amen.

    <leader>gs :Gstatus
    <leader>gw :Gwrite
    <leader>gd :Gdiff
    <leader>gc :Gcommit
    <leader>gb :Gblame
    <leader>gl :Glog
    <leader>gp :Git push

## [vim-indent-guides]
Adds a nice, subtle highlight to show indent levels. I find it works best with
soft tabs, which is active in this distro.

You can toggle indent guides using:

    <leader>ig

## [vim-preview]
Preview markup files like markdown, rdoc, textile and rst in your browser with
<code>&lt;leader&gt;P</code>

## [vim-repeat]
Enables certain plugins to make <code>.</code> (repeat) smarter and more
atomic.

## [vim-surround]
One of the most **underrated** plugins in my arsenal. It's all about changing
"surroundings": parenthesis, brackets, quotes, tags, and more. [Tim Pope explains it
better](https://github.com/tpope/vim-surround).

## [vim-unimpaired]
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

## [vim-speeddating]
Gets women to find you attractive. Or allows you to change date and time
formats with ease. One or the other, I can never remember.

    <C-A>   Increment
    <C-X>   Decrement
    d<C-A>  Sets timestamp under cursor to current time

## [vim-multiedit]
Do you envy Sublime Text for it's multiple selection editing? Of course you do.
And this plugin tries its best to salvage your relationship with Vim by giving
you that functionality.

## [vim-transmitty]
This integrates the mac app Transmit with vim by using it's "Docksend" feature.
It will send your current file to Transmit for upload.

It will also do a shallow search for compiled files (e.g. run it on a SCSS file
and it will look for its CSS counterpart to upload).

    <leader>ou      Upload this file or, if applicable, it's compiled version 
    <leader>oU      Don't be clever, just upload this file

## [vim-forrestgump]
One thing I miss from textmate? ⌘R and ⌥⌘R.

The former would run the current script and display output in a separate
window. The latter would run selected code (or the current line). Output would
be shown in an output window.

This simple plugin aims to mimic that, except it is mapped to:

    <leader>r       Run file (or selected lines)

Works with php, python, ruby, perl, javascript, coffeescript and shellscript
out of the box.

## [YouCompleteMe]
"YouCompleteMe is a fast, as-you-type, fuzzy-search code completion engine for
Vim. It has several completion engines: an identifier-based engine that works
with every programming language, a semantic, Clang-based engine that provides
native semantic code completion for C/C++/Objective-C/Objective-C++ (from now
on referred to as "the C-family languages") and an omnifunc-based completer
that uses data from Vim's omnicomplete system to provide semantic completions
for many other languages (Python, Ruby, PHP etc.)."

Oh, and it rocks.

[Ack]:https://github.com/mileszs/ack.vim
[CtrlP]:https://github.com/kien/ctrlp.vim
[NERDTree]:https://github.com/scrooloose/nerdtree
[PickAColor]:https://github.com/vim-scripts/PickAColor.vim
[PIV]:https://github.com/spf13/PIV
[Powerline]:https://github.com/Lokaltog/vim-powerline
[Syntastic]:https://github.com/scrooloose/syntastic
[Tabular]:https://github.com/godlygeek/tabular
[Tagbar]:https://github.com/majutsushi/tagbar
[YankRing]:https://github.com/vim-scripts/YankRing.vim
[bufkill]:https://github.com/vim-scripts/bufkill.vim
[delimitMate]:https://github.com/Raimondi/delimitMate
[tcomment]:https://github.com/tomtom/tcomment_vim
[ultisnips]:https://github.com/SirVer/ultisnips
[vim-easytags]:https://github.com/xolox/vim-easytags
[vim-endwise]:https://github.com/tpope/vim-endwise
[vim-fugitive]:https://github.com/tpope/vim-fugitive
[vim-indent-guides]:https://github.com/nathanaelkane/vim-indent-guides
[vim-php-namespace]:https://github.com/hlissner/vim-php-namespace
[vim-preview]:https://github.com/spf13/vim-preview
[vim-repeat]:https://github.com/tpope/vim-repeat
[vim-surround]:https://github.com/tpope/vim-surround
[vim-unimpaired]:https://github.com/tpope/vim-unimpaired
[vim-speeddating]:https://github.com/tpope/vim-speeddating
[vim-multiedit]:https://github.com/hlissner/vim-multiedit
[vim-transmitty]:https://github.com/hlissner/vim-transmitty
[vim-forrestgump]:https://github.com/hlissner/vim-forrestgump
[YouCompleteMe]:https://github.com/Valloric/YouCompleteMe
