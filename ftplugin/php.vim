" vim-php-namespaces
" Add 'use's
imap <buffer> <Leader>u <C-O>:call PhpInsertUse()<CR>
map <buffer> <Leader>u :call PhpInsertUse()<CR> 

" Expand into fully qualified class names
imap <buffer> <Leader>e <C-O>:call PhpExpandClass()<CR>
map <buffer> <Leader>e :call PhpExpandClass()<CR>
