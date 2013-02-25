"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 gvimrc                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" mmyes, quite
set guifont=Inconsolata:h16

" j doesn't seem to work from terminal
set formatoptions+=j

" Say neigh to UI cruft!
set go-=T
set go-=l
set go-=L
set go-=r
set go-=R

if has('gui_macvim')
    " Replace some CMD shortcuts
    macmenu &File.New\ Tab key=<nop>
    macmenu &File.Open\.\.\. key=<nop>

    nnoremap <D-t> :CtrlP<CR>
    nnoremap <D-o> :e <C-R>=expand("%:p:h")<CR>/
    nnoremap <D-O> :CtrlPBuffer<CR>

    " Quick way to refer to my dev folder (I use homebrew)
    cnoremap $$ /usr/local/dev/

    " Textmate-like CMD+Enter
    inoremap <D-CR> <C-O>o
    inoremap <S-D-CR> <C-O>O

    " Commenting using CMD+/"
    imap <D-/> <C-o><leader>/
    nmap <D-/> <leader>/
    vmap <D-/> <leader>/

    " Easier indent control
    nmap <D-]> >>
    nmap <D-[> <<

    " Fast scrolling shortcut
    map <D-j> 5j
    map <D-k> 5k

    " Outside apps {{
        " Open folder in Finder
        nnoremap <silent> <leader>of :exe '!open '.shellescape(expand("%:p:h"))<CR><CR>
        " Send current file to launchbar
        nnoremap <silent> <leader>ol :exe '!open -a Launchbar '.shellescape(expand("%"))<CR><CR>
        " Open a terminal CD'd to the current file's folder
        nnoremap <silent> <leader>ot :exe '!open -a iTerm '.shellescape(expand("%:p:h"))<CR><CR>

        " Send to transmit for FTP upload
        au FileType scss,less,stylus 
            \ let b:ml_upload_dir = "../css" |
            \ let b:ml_upload_ext = "css"

        func! MlUpload()
            if exists('b:ml_upload_ext')
                let basedir = expand("%:p:h") . "/" . b:ml_upload_dir . "/"
                let filename = expand("%:t:r") . "." . b:ml_upload_ext
                if filereadable(basedir.filename)
                    call system('open -a Transmit ' . shellescape(basedir . filename))
                    echom "File uploaded (".filename.")"
                else
                    echoe "Couldn't find file to upload (".filename.")"
                endif
            else
                if strlen(expand("%"))
                    call system('open -a Transmit ' . shellescape(expand("%")))
                    echom "File uploaded (".expand("%:t").")"
                else
                    echoe "File must be saved!"
                endif
            endif
        endfunc

        nnoremap <silent> <leader>ou :call MlUpload()<CR>
    " }}
endif

" vim: set foldmarker={{,}} foldlevel=0 foldmethod=marker
