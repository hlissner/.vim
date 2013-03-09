" vim-php-namespaces
" Add 'use's
imap <buffer> <localleader>u <C-O>:call PhpInsertUse()<CR>
map <buffer> <localleader>u :call PhpInsertUse()<CR> 

" Expand into fully qualified class names
imap <buffer> <localleader>e <C-O>:call PhpExpandClass()<CR>
map <buffer> <localleader>e :call PhpExpandClass()<CR>
