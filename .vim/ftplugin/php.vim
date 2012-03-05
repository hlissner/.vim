
if exists('g:my_php_loaded')
  finish
endif
let g:my_php_loaded = 1

function! PhpRun()
    if expand("%") != ""
        !php %
    else
        %w !php
    endif
endfunction

noremap <leader>rf :call PhpRun()<CR>
