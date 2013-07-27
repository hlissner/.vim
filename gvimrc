"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 gvimrc                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Say neigh to UI cruft!
set go-=T
set go-=l
set go-=L
set go-=r
set go-=R
set go+=c

" For macvim
if has('gui_macvim')

    set transparency=2

    " j doesn't seem to work from terminal
    set formatoptions+=j

    " mmyes, quite
    set guifont=Ubuntu\ Mono:h14

    " Replace some CMD shortcuts
    macmenu &File.New\ Tab key=<nop>
    macmenu &File.Open\.\.\. key=<nop>
    macmenu &Tools.Make key=<nop>

    nnoremap <D-t> :CtrlP<CR>
    nnoremap <D-o> :e <C-R>=expand("%:p:h")<CR>/
    nnoremap <D-O> :CtrlPBuffer<CR>

    " Textmate-like CMD+Enter
    inoremap <D-CR> <C-O>o
    inoremap <S-D-CR> <C-O>O

    " Commenting using CMD+/"
    map <D-/> <leader>/

    " Easier indent control
    nmap <D-]> >>
    nmap <D-[> <<

    " Fast scrolling shortcut
    map <D-j> 5j
    map <D-k> 5k

    " Replace :make
    map <D-b> :Dispatch<CR>

    " Shortcuts to outside apps {
        " Open in finder
        nnoremap <localleader>f :silent !open %:p:h<CR>

        " Open in terminal
        nnoremap <localleader>t :silent !open -a iTerm %:p:h<CR>

        " Send to transmit
        nnoremap <localleader>u :silent !open -a Transmit %<CR>
    " }

else

    " For Windows
    if has("gui_win32") || has("win64")
        set guifont=Inconsolata:h11

        set go-=m
        set go-=t
        set novisualbell

        " Restore some windows-esque keyboard commands
        map <C-s> :w<CR>
        imap <C-v> <C-o>P
        cmap <C-v> <C-r>*

        " Restore word-deletion on windows
        inoremap <C-BS> <C-O>db<BS>
        inoremap <C-Del> <C-O>de

        set lines=70
        set columns=100

        " Shortcuts to outside apps {
            " Open in finder
            nnoremap <localleader>f :exe 'silent !explorer.exe '.shellescape(expand("%:p:h"))<CR><CR>

            " Open in terminal
            nnoremap <localleader>t :silent !conemu -a iTerm %:p:h<CR>
        " }
    endif

    " For gvim
    
    " Commenting using CMD+/"
    map <C-/> <leader>/

    " Textmate-like CMD+Enter
    inoremap <C-CR> <C-O>o
    inoremap <S-C-CR> <C-O>O

endif

" vim:set foldmarker={,} foldlevel=0 foldmethod=marker:
