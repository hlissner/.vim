" Formatting
setl foldmarker={,}
setl foldmethod=marker

" call textobj#user#plugin('css', {
"             \   '-': {
"             \       'select-a': 'ap',
"             \       'select-a-function': 'CssProperty',
"             \       'select-i': 'ip', 
"             \       'select-i-function': 'CssPropertyValue',
"             \   }
"             \ })
"
" function! CssProperty()
"     normal! ^
"     let head_pos = getpos('.')
"     normal! t:
"     let end_pos = getpos('.')
"
"     return ['v', head_pos, end_pos]
" endfunction
"
" function! CssPropertyValue()
"     let line = line('.')
"     normal! ^f:
"
"     call search('[^ \n;]', '', line)
"
"     let head_pos = getpos('.')
"     if head_pos[1] != line || getline('.')[head_pos[2]-1] ==# ';'
"         return 0
"     endif
"     normal! t;
"     let tail_pos = getpos('.')
"
"     return ['v', head_pos, tail_pos]
" endfunction

let b:switch_custom_definitions =
\ [
\   ['left', 'right'],
\   ['top', 'bottom'],
\ ]
