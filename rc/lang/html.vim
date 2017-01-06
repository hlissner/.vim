""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'hail2u/vim-css3-syntax',     { 'for': 'css' }
Plug 'digitaltoad/vim-pug',        { 'for': 'pug' }
Plug 'valloric/MatchTagAlways',    { 'for': ['html', 'xml'] }
Plug 'gorodinskiy/vim-coloresque', { 'for': ['css', 'scss', 'sass', 'less'] }
Plug 'mattn/emmet-vim',            { 'for': 'html' }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
imap <D-e> <Plug>(emmet-expand-abbr)

au FileType pug setlocal cinwords=if,elif,else,for,while,try,except,finally,def,class,with
au FileType css,scss let b:switch_custom_definitions=[['left', 'right'], ['top', 'bottom']]
au FileType less setl makeprg=lessc\ %:p\ %:p:h/%:r.css

" vim:set ft=vim:
