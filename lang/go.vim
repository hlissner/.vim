""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'fatih/vim-go', { 'for': 'go' }
Plug 'nsf/gocode',   { 'for': 'go', 'rtp': 'nvim/' }


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-go
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
" Enable goimports to automatically insert import paths instead of gofmt:
let g:go_fmt_command = "goimports"
let g:go_snippet_case_type = "camelcase"
" By default vim-go shows errors for the fmt command, to disable it:
let g:go_fmt_fail_silently = 1
let g:go_imports_fail_silently = 1
let g:go_play_open_browser = 1
let g:go_play_browser_command = "firefox"
" By default the testing commands run asynchronously in the background and display results with go#jobcontrol#Statusline().
let g:go_term_enabled = 1
let g:go_auto_type_info = 1 " automatically show the information whenever you move your cursor
let g:go_def_mode = 'godef'
let g:go_decls_includes = "func,type"

let g:completor_go_omni_trigger = '(?:\b[^\W\d]\w*|[\]\)])\.(?:[^\W\d]\w*)?'

let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
let g:go_metalinter_autosave_enabled = ['vet', 'golint']
let g:go_metalinter_deadline = "5s"
