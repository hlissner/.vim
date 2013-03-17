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
    map <D-/> <leader>/

    " Easier indent control
    nmap <D-]> >>
    nmap <D-[> <<

    " Fast scrolling shortcut
    map <D-j> 5j
    map <D-k> 5k

else

    " For Windows
    if has("gui_win32") || has("win64")
        set guifont=Consolas:h10
    endif

    " For gvim
    
    " Commenting using CMD+/"
    map <C-/> <leader>/

endif

" vim: set foldmarker={,} foldlevel=0 foldmethod=marker
