" Editor
"
" Making vim act more like a modern editor with autoclosing delimiters,
" typing things for me, more intelligent auto-commenting, etc.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'szw/vim-maximizer'          " toggling maximizing of a buffer
Plug 'justinmk/vim-sneak'         " 2-character search motions
Plug 'Raimondi/delimitMate'       " autoclose delimiters

Plug 'godlygeek/tabular'          " for aligning text
Plug 'tomtom/tcomment_vim'        " comment out code with native comment syntax
Plug 'tpope/vim-endwise'          " auto-end code blocks (e.g. for ruby or viml)
Plug 'tpope/vim-surround'         " manipulation of surrounding delimiters
Plug 'AndrewRadev/switch.vim'     " switching between true/false, yes/no, etc

Plug 'airblade/vim-gitgutter'     " visual git diffs in the gutter
Plug 'thinca/vim-visualstar'      " smarter * and #

Plug 'vim-scripts/PickAColor.vim' " Color picker pop-up

" Dash.app documentation (mac only)
if has('macunix')
    Plug 'rizzatti/dash.vim'
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" vim-maximizer
let g:maximizer_set_default_mapping = 0
nnoremap <silent> <C-w>o :<C-u>MaximizerToggle!<CR>

" vim-sneak
let g:sneak#s_next = 1

" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

" tcomment_vim
let g:tcomment_types = {'blade': '{-- %s --}', 'twig': '{# %s #}'}

" gitgutter
let g:gitgutter_eager = 0

"
au FileType text setl wrap linebreak formatoptions-=atc formatoptions+=l
au FileType snippet let b:endwise_addition='end&' | let b:endwise_words='snippet' | let b:endwise_syngroups='snippets,snipStart,snipKeyword'

" vim:set ft=vim:
