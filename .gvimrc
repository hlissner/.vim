" VIMRC (OF DOOM?) 2.0 {
"               _                          _   _ 
"   __  ___   _| |__   ___ _ __ __ _ _ __ | |_| |
"   \ \/ / | | | '_ \ / _ \ '__/ _` | '_ \| __| |
"    >  <| |_| | |_) |  __/ | | (_| | | | | |_|_|
"   /_/\_\\__,_|_.__/ \___|_|  \__,_|_| |_|\__(_)
"                                              
"   Author: Henrik Lissner
"   Url: http://github.com/hlissner/dotfiles
"
"   This is only for my mac, so linuxers and windowists need not apply (not
"   that I don't love linux <3)
"
" }

if has('gui_macvim')
    colo xuberant

    set guifont=Monaco:h13
    set guioptions=aAce
    set guioptions-=T           " remove the toolbar

    " A nice transparent-when-unfocused effect
    set transparency=0
    au FocusGained * set transparency=0
    au FocusLost * set transparency=10

    " Replace CMD+T with CtrlP
    macmenu &File.New\ Tab key=<nop>
    nnoremap <D-t> :CtrlP<CR>
    nmap <D-/> <leader>/
endif

if filereadable(expand("~/.gvimrc.local"))
    source ~/.gvimrc.local
endif
