"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 gvimrc                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Say neigh to UI cruft!
set go-=T
set go-=l
set go-=L
set go-=r
set go-=R

" Don't show dialogues, use text prompts
set go+=c

" For macvim
if has('gui_macvim')

    " j doesn't seem to work from terminal
    set formatoptions+=j

    " mmyes, quite
    " set guifont=Ubuntu\ Mono:h14
    " set guifont=Monaco:h12
    set guifont=Inconsolata:h16

    " Replace some CMD shortcuts
    macmenu &File.Open\.\.\. key=<nop>
    macmenu &Tools.Make key=<nop>

    " Switching buffers
    nmap <D-Right> ]b
    nmap <D-Left> [b

    " Textmate-like CMD+Enter
    inoremap <D-CR> <C-O>o
    inoremap <S-D-CR> <C-O>O

    " Fast scrolling
    nmap <D-j> 5j
    nmap <D-k> 5k

    " Commenting using CMD+/"
    map <D-/> <leader>/

    " Replace :make
    map <D-b> :Dispatch<CR>
    map <D-d> :NERDTreeToggle<CR>

    " Shortcuts to outside apps {{{
        " Open in finder
        nnoremap <localleader>f :silent !open %:p:h<CR>
        nnoremap <localleader>F :silent !open .<CR>
        " Open in terminal
        nnoremap <localleader>t :silent !open -a iTerm %:p:h<CR>
        nnoremap <localleader>T :silent !open -a iTerm .<CR>
        " Send to transmit
        nnoremap <localleader>u :silent !open -a Transmit %<CR>
    " }}}

else

    " For unix only
    inoremap <C-v> <C-r>*
    cnoremap <C-v> <C-r>*

    set go-=m
    set novisualbell

    " For gvim
    set guifont=Monospace\ 10
    
    " Commenting using CMD+/"
    map <C-/> <leader>/

    " Textmate-like CMD+Enter
    inoremap <C-CR> <C-O>o
    inoremap <S-C-CR> <C-O>O

endif
