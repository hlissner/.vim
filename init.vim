set nocompatible
filetype off

call plug#begin($XDG_DATA_HOME.'/vim/bundle')

" Plugins {{{
    " Essentials
    Plug 'Shougo/vimproc', { 'do': 'make' }
    Plug 'editorconfig/editorconfig-vim'
    Plug 'tpope/vim-fugitive'    " git in vim
    Plug 'sheerun/vim-polyglot'  " support for a variety of languages
    " Vim functionality fixes/enhancements
    Plug 'tpope/vim-repeat'      " better repeat compatibility ('.')
    Plug 'vim-scripts/vis'       " improved visual commands
    " kill buffers without affecting window layout
    Plug 'moll/vim-bbye', { 'on': ['Bdelete', 'Bclose'] }
    " Communicating with Tmux
    Plug 'christoomey/vim-tmux-navigator', { 'on': ['TmuxNavigateLeft', 'TmuxNavigateDown', 'TmuxNavigateRight', 'TmuxNavigateUp', 'TmuxNavigatePrevious'] }
    " Theme
    Plug 'joshdick/onedark.vim'
" }}}


""""""""""""""""""""""""""""""""""""""""
" Editor config                        "
""""""""""""""""""""""""""""""""""""""""
" Making vim act more like a modern editor with autoclosing delimiters, typing
" things for me, more intelligent auto-commenting, etc.
Plug 'AndrewRadev/switch.vim', { 'on': ['Switch', 'SwitchReverse'] }
Plug 'airblade/vim-gitgutter'     " visual git diffs in the gutter
Plug 'benekastah/neomake'         " Syntax checker
Plug 'godlygeek/tabular', { 'on': 'Tabularize' } " aligning text
Plug 'justinmk/vim-sneak'         " 2-character search motions
Plug 'Raimondi/delimitMate'       " autoclose delimiters
Plug 'szw/vim-maximizer', { 'on': 'MaximizerToggle' } " maximize window
Plug 'thinca/vim-visualstar'      " smarter * and #
Plug 'tomtom/tcomment_vim'        " comment out code with native comment syntax
Plug 'tpope/vim-endwise'          " auto-end code blocks (e.g. for ruby or viml)
Plug 'tpope/vim-surround'         " manipulation of surrounding delimiters

" vim-gitgutter
let g:gitgutter_eager = 0
" vim-maximizer
let g:maximizer_set_default_mapping = 0
" vim-sneak
let g:sneak#s_next = 1
" delimitMate
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
" tcomment_vim
let g:tcomment_types = {'blade': '{-- %s --}', 'twig': '{# %s #}'}
" neomake
autocmd! BufWritePost * Neomake
" vim-endwise
au FileType snippet let b:endwise_addition='end&' | let b:endwise_words='snippet' | let b:endwise_syngroups='snippets,snipStart,snipKeyword'
" misc
au FileType text setl wrap linebreak formatoptions-=atc formatoptions+=l


" How emacs handles the CWD is different from vim. To minimize the context
" shift, these settings cause vim to behave more like emacs.
"
" In a nutshell this means:
"   1. The CWD will be the directory of the current buffer
"   2. When Neotree or CtrlP is used, they pretend the CWD is the root of the
"      project (usually the nearest parent with a .git folder -- see
"      vim-rooter).
Plug 'airblade/vim-rooter'
let g:rooter_manual_only = 1


""" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'hlissner/vim-neosnippets'

let g:neosnippet#snippets_directory = ['~/.vim/bundle/vim-neosnippets']
let g:neosnippet#disable_runtime_snippets = { '_' : 1 }


""""""""""""""""""""""""""""""""""""""""
" Projects                             "
""""""""""""""""""""""""""""""""""""""""
" These plugins/settings make navigating and searching code and project files
" simpler.
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

" NERDTree
let NERDTreeChDirMode = 2
let NERDTreeMinimalUI = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = ['\~$', '\.swo$', '\.swp$', '\.git$', '\.hg', '\.svn', '\.bzr', '\.settings', '\.project', '\.DS_Store']

" ctrlp
if executable('fd')
    let s:ctrlp_fallback = 'fd -t f -c never "" "%s"'
    let g:ctrlp_use_caching = 0
elseif executable('rg')
    let s:ctrlp_fallback = 'rg %s --color never --no-heading --line-number'
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


""""""""""""""""""""""""""""""""""""""""
" Global config                        "
""""""""""""""""""""""""""""""""""""""""
" External configuration files
runtime keybinds.vim
runtime! lang/*.vim

call plug#end()
syntax on
filetype plugin indent on

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8

set bomb
set binary
if has('ttimeout')
    set ttimeout
    set ttimeoutlen=0
endif

" Swap files, history & persistence {{{
    " No backup (that's what git is for!) and swapfiles are annoying
    set backupdir=$XDG_CACHE_HOME/vim/backup
    set nobackup
    set nowritebackup
    set noswapfile
    if has('persistent_undo')
        set undodir=$XDG_DATA_HOME/vim/undo
        set undolevels=500
        set undoreload=500
    endif
    set history=5000

    " preserve buffer state (cursor location, folds, etc.)
    set viewdir=$XDG_DATA_HOME/vim/views
    set viewoptions=cursor,folds,unix,slash
    augroup vimrc-persistence
        au!
        au BufWinLeave * if expand("%") != "" | silent! mkview | endif
        au BufWinEnter * if expand("%") != "" | silent! loadview | endif
    augroup END

    set viminfo+='1000,n$XDG_CACHE_HOME/vim/info
" }}}

set autoread                 " Auto-update a file that's been edited externally
set backspace=indent,eol,start
set fileformats+=mac
set hidden                   " Allow buffer switching without saving
set lazyredraw               " Don't update screen while running macros
set ttyfast
set noeol
set nospell                  " No spell check, please
set nrformats-=octal
set shortmess+=filmnrxoOtTs
set visualbell               " No sounds!
set modeline

set iskeyword-=.             " Regard . as a word boundary
set iskeyword-=_             " Regard _ as a word boundary
set iskeyword-=#             " Regard # as a word boundary

" Show buffer name in tmux window name
set titlestring=%f%m
set title

" Disable matchit highlighting, I find it distracting
let loaded_matchparen = 1

" Switch to current file directory
autocmd BufEnter * silent! lcd %:p:h

" Automatically close the popup menu / preview window
au InsertLeave * if pumvisible() == 0|silent! pclose|endif

" Do syntax highlighting from the start
au BufEnter * :syntax sync fromstart

" Enable clipboard
if has('unnamedplus')
    set clipboard=unnamedplus
else
    set clipboard=unnamed
endif

augroup vimrc-remember-cursor-position
    au!
    au BufWinEnter * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

    " Instead of reverting the cursor to the last position in the buffer, we
    " set it to the first line when editing a git commit message
    au FileType gitcommit au! BufEnter COMMIT_EDITMSG call setpos('.', [0, 1, 1, 0])
augroup END

" UI/Appearance {{{
    set number           " Line numbers
    set showcmd          " Show command issued
    set fillchars=vert:│
    set list
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
    set textwidth=80
    " set cursorline     " Line highlight

    " StatusBar
    set ruler  " Show line/col no in statusline
    set rulerformat=%30(%=%y%m%r%w\ %l,%c%V\ %P%)
    if has('statusline')
        set laststatus=1
        set statusline=\ %F
        set statusline+=\ %W%H%M%R                     " Options
        set statusline+=%=                             " left/right separator
        set statusline+=\ %{fugitive#statusline()}     " Git Hotness
        set statusline+=\ %c                           " cursor column
        set statusline+=\ %l/%L                        " cursor line/total lines
        set statusline+=\ \:%P                         " percent through file
        set statusline+=\ %Y                           " filetype
    endif

    " No background in terminal
    if has('autocmd') && !has('gui_running')
        let s:white = { 'gui': '#ABB2BF', 'cterm': '145', 'cterm16' : '7' }
        autocmd ColorScheme * call onedark#set_highlight('Normal', { 'fg': s:white }) " No `bg` setting
    end

    colorscheme onedark
" }}}

" Movement & search {{{
    set nostartofline
    set sidescrolloff=5
    set incsearch            " find as you type
    set hlsearch             " Highlight search terms
    set ignorecase           " case insensitive search
    set smartcase            " case sensitive when uc present
    set gdefault             " global flag for substitute by default

    if executable('rg')
        let g:ackprg = 'rg --with-filename --no-heading --line-number --color=never'
        set grepprg=rg\ --with-filename\ --no-heading\ --line-number\ --color=never
    elseif executable('ack-grep')
        let g:ackprg = "ack-grep -H --nocolor --nogroup --column"
    endif
" }}}

" Text formatting {{{
    set autoindent
    set expandtab
    set shiftround
    set shiftwidth=4 tabstop=4 softtabstop=4
    set nowrap
    " Backspace and cursor keys to wrap
    set whichwrap=b,s,h,l,<,>,[,]
    " see :h fo-table
    set formatoptions=qrn1lr

    function! <SID>StripTrailingWhitespaces()
        if &ft =~ 'vim'
            return
        endif
        let l = line('.')
        let c = col('.')
        %s/\s\+$//e
        call cursor(l, c)
    endfunction
    autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()
" }}}

" Folding {{{
    set foldlevel=1
    " Cleaner, more readable fold headers
    set foldtext=MyFoldText()
    function! MyFoldText()
        let line = getline(v:foldstart)
        " Lines that have been folded
        let nl = v:foldend - v:foldstart + 1
        let indent = repeat(' ', indent(v:foldstart))
        let endcol = &colorcolumn ? &colorcolumn : &textwidth
        let startcol = &columns < endcol ? &columns-4 : endcol
        return indent . substitute(line,"^ *","",1)
    endfunction
" }}}

" Omnicomplete + wild settings {{{
    set tags=./tags,./../tags,./../../tags,./../../../tags,tags

    set complete-=i
    set completeopt=menu
    set wildmenu                    " Show menu instead of auto-complete
    set wildmode=list:longest,full  " command <Tab> completion: list
                                    " matches -> longest common -> then
                                    " all.
    set wildignore+=*.swp,*.log,.sass-cache,.codekit-cache,config.codekit
    set wildignore+=*.class,*.o,*.pyc,*.obj,*DS_Store*
" }}}

" vim:set fdl=0 fdm=marker:
