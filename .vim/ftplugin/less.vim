
if exists('g:my_less_loaded')
    finish
endif
let g:my_less_loaded = 1

nnoremap <leader>rf :w <BAR> !lessc % > %:t:r.css<CR><space>
