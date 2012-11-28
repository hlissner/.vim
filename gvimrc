"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 gvimrc                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Yes, quite
set guifont=Inconsolata:h14

" j doesn't seem to work from terminal
set formatoptions+=j

" Say neigh to UI cruft!
set go-=T
set go-=l
set go-=L
set go-=r
set go-=R

if has('gui_macvim')
    set transparency=2
    " Replace some CMD shortcuts
    macmenu &File.New\ Tab key=<nop>
    macmenu &File.Open\.\.\. key=<nop>

    nnoremap <D-t> :CtrlP<CR>
    nnoremap <D-o> :e <C-R>=expand("%:p:h")<CR>/
    nnoremap <D-O> :CtrlPBuffer<CR>

    " Textmate-like CMD+Enter
    inoremap <D-CR> <C-O>o
    inoremap <S-D-CR> <C-O>O

    " Commenting using CMD+/"
    imap <D-/> <C-o><leader>/
    nmap <D-/> <leader>/
    vmap <D-/> <leader>/

    " Fast scrolling shortcut
    map <D-j> ∆
    map <D-k> ˚

    " Outside apps {{
        " Open folder in Finder
        nnoremap <silent> <leader>of :exe '!open '.shellescape(expand("%:p:h"))<CR><CR>
        " Send current file to launchbar
        nnoremap <silent> <leader>ol :exe '!open -a Launchbar '.shellescape(expand("%"))<CR><CR>
        " Open a terminal CD'd to the current file's folder
        nnoremap <silent> <leader>ot :exe '!open -a iTerm '.shellescape(expand("%:p:h"))<CR><CR>

        " Send file to transmit for upload (dropsend)
        noremap <silent> <leader>ou :exe '!open -a Transmit '.shellescape(expand("%"))<CR><CR>
    " }}
endif

" vim: set foldmarker={{,}} foldlevel=0 foldmethod=marker
