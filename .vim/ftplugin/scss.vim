
if exists('g:my_scss_loaded')
  finish
endif
let g:my_scss_loaded = 1

" com! scss_compile
" com! scss_compile_project
" com! scss_upload

nnoremap <leader>rs ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
