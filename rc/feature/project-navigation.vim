" Project Navigation
"
" These plugins/settings make navigating and searching code and project files
" simpler.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'            " file explorer sidebar
Plug 'jistr/vim-nerdtree-tabs'

Plug 'kien/ctrlp.vim'                 " Go-to-anything/Command-T
Plug 'tacahiroy/ctrlp-funky'          " extension for jumping to functions
Plug 'jasoncodes/ctrlp-modified.vim'  " extension for listing git modified files

" File searching
if executable('ag')
    Plug 'rking/ag.vim'
elseif executable('ack')
    Plug 'mileszs/ack.vim'
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\~$', '\.swo$', '\.swp$', '\.git$', '\.hg', '\.svn', '\.bzr', '\.settings', '\.project', '\.DS_Store']

" ctrlp
if executable('ag')
    let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
elseif executable('ack-grep')
    let s:ctrlp_fallback = 'ack-grep %s --nocolor -f'
elseif executable('ack')
    let s:ctrlp_fallback = 'ack %s --nocolor -f'
else
    let s:ctrlp_fallback = 'find %s -type f'
endif
if exists("g:ctrlp_user_command")
    unlet g:ctrlp_user_command
endif
let g:ctrlp_extensions = ['tag', 'buffertag', 'funky']
let g:ctrlp_cache_dir = "~/.vim/tmp/ctrlp"
let g:ctrlp_match_window = 'bottom,order:btt,min:10,max:10,results:10'
let g:ctrlp_custom_ignore = {
            \   'dir':  '\.(git|hg|svn|settings)$|tmp$',
            \   'file': '\.(exe|so|dll|sass-cache|classpaths|project|cache|jpg|png|gif|swf)$'
            \ }
let g:ctrlp_user_command = {
            \   'types': {
            \     1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
            \     2: ['.hg', 'hg --cwd %s locate -I .'],
            \   },
            \   'fallback': s:ctrlp_fallback
            \ }

" vim:set ft=vim:
