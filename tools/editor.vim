" Editor
"
" Making vim act more like a modern editor with autoclosing delimiters,
" typing things for me, more intelligent auto-commenting, etc.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle maximizing of a buffer
Plug 'szw/vim-maximizer', { 'on': 'MaximizerToggle' }
Plug 'justinmk/vim-sneak'         " 2-character search motions
Plug 'Raimondi/delimitMate'       " autoclose delimiters
" for aligning text
Plug 'godlygeek/tabular', { 'on': 'Tabularize' }
Plug 'tomtom/tcomment_vim'        " comment out code with native comment syntax
Plug 'tpope/vim-endwise'          " auto-end code blocks (e.g. for ruby or viml)
Plug 'tpope/vim-surround'         " manipulation of surrounding delimiters
" switching between true/false, yes/no, etc
Plug 'AndrewRadev/switch.vim', { 'on': ['Switch', 'SwitchReverse'] }

Plug 'airblade/vim-gitgutter'     " visual git diffs in the gutter
Plug 'thinca/vim-visualstar'      " smarter * and #


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-maximizer
let g:maximizer_set_default_mapping = 0

" vim-sneak
let g:sneak#s_next = 1

" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" tcomment_vim
let g:tcomment_types = {'blade': '{-- %s --}', 'twig': '{# %s #}'}

" switch

" gitgutter
let g:gitgutter_eager = 0

"
au FileType text setl wrap linebreak formatoptions-=atc formatoptions+=l
au FileType snippet let b:endwise_addition='end&' | let b:endwise_words='snippet' | let b:endwise_syngroups='snippets,snipStart,snipKeyword'

" vim:set ft=vim:
