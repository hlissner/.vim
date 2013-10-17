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

    set transparency=2

    " j doesn't seem to work from terminal
    set formatoptions+=j

    " mmyes, quite
    set guifont=Ubuntu\ Mono:h15

    " Replace some CMD shortcuts
    macmenu &File.Open\.\.\. key=<nop>
    macmenu &Tools.Make key=<nop>

    " Switching tabs
    nmap <D-1> 1gt
    nmap <D-2> 2gt
    nmap <D-3> 3gt
    nmap <D-4> 4gt
    nmap <D-5> 5gt
    nmap <D-6> 6gt
    nmap <D-7> 7gt
    nmap <D-8> 8gt
    nmap <D-9> 9gt
    nmap <D-0> 10gt

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

    " Shortcuts to outside apps {
        " Open in finder
        nnoremap <localleader>f :silent !open %:p:h<CR>
        " Open in terminal
        nnoremap <localleader>t :silent !open -a iTerm %:p:h<CR>
        " Send to transmit
        nnoremap <localleader>u :silent !open -a Transmit %<CR>
    " }

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

" vim:set foldmarker={,} foldlevel=0 foldmethod=marker:
