" Settings
set foldmethod=syntax 


func! JavaRun()
    Javac
    Java %
endfunc

" Keymappings
nnoremap <buffer><silent> <localleader>r :call JavaRun()<CR><CR>
nnoremap <buffer><silent> <localleader>b :Javac<CR>
nnoremap <buffer><silent> <localleader>R :JavaRename 
nnoremap <buffer><silent> <localleader>i :JavaImport<CR>
nnoremap <buffer><silent> <localleader>I :JavaImportMissing<CR>
vnoremap <buffer><silent> <localleader>f :JavaFormat<CR>

" Make auto-complete shortcut match eclim-based omnicomplete
imap <expr> <A-Space>   pumvisible() ? "\<C-n>" : "\<C-x><C-u>"
imap <expr> <S-A-Space> pumvisible() ? "\<C-p>" : "\<<C-x><C-u>"
