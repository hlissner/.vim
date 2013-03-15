"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 gvimrc                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Say neigh to UI cruft!
set go-=T
set go-=l
set go-=L
set go-=r
set go-=R

" For macvim
if has('gui_macvim')

    set transparency=1

    " j doesn't seem to work from terminal
    set formatoptions+=j

    " mmyes, quite
    set guifont=Andale\ Mono:h14

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
    nmap <D-/> <leader>/
    vmap <D-/> <leader>/

    " Easier indent control
    nmap <D-]> >>
    nmap <D-[> <<

    " Fast scrolling shortcut
    map <D-j> 5j
    map <D-k> 5k

    " Outside apps {
        " Open folder in Finder
        nnoremap <silent> <leader>of :exe '!open '.shellescape(expand("%:p:h"))<CR><CR>
        " Send current file to launchbar
        nnoremap <silent> <leader>ol :exe '!open -a Launchbar '.shellescape(expand("%"))<CR><CR>
        " Open a terminal CD'd to the current file's folder
        nnoremap <silent> <leader>ot :exe '!open -a iTerm '.shellescape(expand("%:p:h"))<CR><CR>
    " }
    
else

    " For Windows
    if has("gui_win32") || has("win64")
        set guifont=Consolas:h10
    endif

    " For gvim
    
    " Textmate-like CMD+Enter
    inoremap <C-CR> <C-O>o
    inoremap <S-C-CR> <C-O>O

    " Commenting using CMD+/"
    nmap <A-/> <leader>/
    vmap <A-/> <leader>/

endif

" vim: set foldmarker={,} foldlevel=0 foldmethod=marker
