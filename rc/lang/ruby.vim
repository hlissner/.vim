""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'tpope/vim-rake',              { 'for': 'ruby' }
Plug 'tpope/vim-projectionist',     { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec',        { 'for': 'ruby' }
Plug 'ecomba/vim-ruby-refactoring', { 'for': 'ruby' }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1

au BufNewFile,BufRead *.rb,*.rbw,*.gemspec,VagrantFile,GemFile setf ft=ruby
au FileType ruby let b:run_mode_command='ruby'

" vim:set ft=vim:
