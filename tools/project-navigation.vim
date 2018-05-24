" Project Navigation
"
" These plugins/settings make navigating and searching code and project files
" simpler.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" file explorer sidebar
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Go-to-anything/Command-T
Plug 'ctrlpvim/ctrlp.vim', { 'on': ['CtrlP', 'CtrlPBuffer', 'CtrlPMixed', 'CtrlPMRU'] }
" extension for jumping to functions
Plug 'tacahiroy/ctrlp-funky', { 'on': 'CtrlPFunky' }
" extension for listing git modified files
Plug 'jasoncodes/ctrlp-modified.vim', { 'on': ['CtrlPModified', 'CtrlPBranch', 'CtrlPBranchModified'] }

" File searching
if executable('rg')
    Plug 'jremmen/vim-ripgrep', { 'on': ['Rg', 'RgRoot'] }
endif
if executable('ack')
    Plug 'mileszs/ack.vim', { 'on': 'Ack' }
endif


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\~$', '\.swo$', '\.swp$', '\.git$', '\.hg', '\.svn', '\.bzr', '\.settings', '\.project', '\.DS_Store']

" Ack
if executable('ag')
    let g:ackprg = 'ag --vimgrep --smart-case'
    cnoreabbrev ag Ack
    cnoreabbrev aG Ack
    cnoreabbrev Ag Ack
    cnoreabbrev AG Ack
endif

" ctrlp
if executable('rg')
   let s:ctrlp_fallback = 'rg %s --color never --no-heading --line-number'
elseif executable('ag')
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
let g:ctrlp_cache_dir = $XDG_CACHE_HOME."/vim/ctrlp"
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
