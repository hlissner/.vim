""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'vim-scripts/python_match.vim', { 'for': 'python' }
Plug 'davidhalter/jedi-vim', { 'for': 'python' }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" jedi
let g:jedi#popup_on_dot = 0
let g:jedi#goto_assignments_command = "<localleader>fa"
let g:jedi#goto_definitions_command = "<localleader>fd"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<localleader>fu"
let g:jedi#rename_command = "<leader>rr"
let g:jedi#show_call_signatures = "0"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#smart_auto_mappings = 0

" syntastic
let g:syntastic_python_checkers=['python', 'flake8']

" Syntax highlight
" Default highlight is better than polyglot
let g:polyglot_disabled = ['python']
let python_highlight_all = 1

au FileType python setl updatetime=4000 makeprg=python\ -u\ %:p

" vim:set ft=vim:
