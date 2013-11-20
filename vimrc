"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                             "
"   Author: Henrik Lissner                                                    "
"   Url: http://github.com/hlissner/vim                                       "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
scriptencoding utf-8

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins {
    " Check to see if neobundle is installed, install it if not
    source $HOME/.vim/rc/deps

    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#rc(expand('~/.vim/bundle'))
    NeoBundleFetch 'Shougo/neobundle.vim'

    " Bundles and their settings are specified externally.
    source $HOME/.vim/rc/plugins
    " A local bundles config separate from this distro.
    try source $HOME/.vimrc.bundles.local catch endtry

    filetype plugin indent on
    NeoBundleCheck
" }

" Preferences {
    syntax on
    set background=dark
    colorscheme molonew
    let g:airline_theme = "badwolf"

    set laststatus=2             " Show statusbar
    set nolist                   " Don't show whitespace chars (indent-guides does it nicer)
    set nospell                  " No spell check, please
    set number                   " Line numbers
    set visualbell               " No sounds!
    set showmatch                " Show matching delimiters
    set browsedir=buffer         " Sets File>Open to start in current file's path
    set noshowmode               " Don't show mode in cmdline (no need with airline)
    set autoread                 " Auto-update a file that's been edited externally
    set backspace=indent,eol,start
    set mouse=a
    set lazyredraw               " Don't update screen while running macros
    set hidden                   " Hide abandoned buffers
    set nostartofline
    set scrolloff=5
    set shortmess+=filmnrxoOtTs

    " Share a clipboard with OS and vim terminal sessions
    if has ('unnamedplus')
        set clipboard=unnamedplus
    else
        set clipboard=unnamed
    endif

    if has('cmdline_info')
        set ruler                " Show line/col no in statusline
        set showcmd              " Show command issued
    endif

    set textwidth=88
    set fillchars=vert:\|

    " Shell {
        " 256bit terminals
        set t_Co=256
    " }
    " Search {
        set incsearch            " find as you type
        set hlsearch             " Highlight search terms
        set ignorecase           " case insensitive search
        set smartcase            " case sensitive when uc present
        set gdefault             " global flag for substitute by default
    " }
    " Omnicomplete {
        set tags=./.tags;/,~/.tags,~/tags

        set completeopt=longest,menu,preview
        set wildmenu                    " Show menu instead of auto-complete
        set wildmode=list:longest,full  " command <Tab> completion: list
                                        " matches -> longest common -> then
                                        " all.
        set wildignore+=.*,*.cache,cache/**,*~,*.swp,*.log,.sass-cache
        set wildignore+=*.class,*.o,*.obj,*DS_Store*

        augroup Omnicomplete
            au!
            " Enable omni completion.
            au FileType css,scss,less setl omnifunc=csscomplete#CompleteCSS
            au FileType html,markdown,htmljinja,xml setl omnifunc=htmlcomplete#CompleteTags
            " au FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
            au FileType xml setl omnifunc=xmlcomplete#CompleteTags
        augroup END

        " Automatically open and close the popup menu / preview window
        au InsertLeave * if pumvisible() == 0|silent! pclose|endif
    " }
    " Formatting {
        set autoindent
        set shiftround
        set expandtab
        set shiftwidth=4
        set tabstop=4
        set softtabstop=4
        " Wrapping
        set nowrap
        " Backspace and cursor keys to wrap
        set whichwrap=b,s,h,l,<,>,[,]
        " see :h fo-table
        set formatoptions=qrn1lr
    " }
    " Folding {
        " set foldenable
        set foldlevel=1
        " Cleaner, readable fold headers
        set foldtext=MyFoldText()
        fu! MyFoldText()
            let line = getline(v:foldstart)
            " Lines that have been folded
            let nl = v:foldend - v:foldstart + 1
            " let foldedLines = "( ".nl." ) "
            " let symbol = ""

            let indent = repeat(' ', indent(v:foldstart))
            let endcol = &colorcolumn ? &colorcolumn : &textwidth
            let startcol = &columns < endcol ? &columns-4 : endcol
            " let outdent = repeat(' ', startcol - strlen(line . foldedLines . symbol))

            " return indent . substitute(line,"^ *","",1) . symbol . outdent . foldedLines
            return indent . substitute(line,"^ *","",1)
        endf
    " }
" }
" History/Backup {
    " No backup (that's what git is for!) and swapfiles are annoying
    set nobackup
    set nowritebackup
    set noswapfile
    if has('persistent_undo')
        set undodir=~/.vim/tmp/undo
        set undofile
        set undolevels=500
        set undoreload=500
    endif
    set history=10000

    " Preserve buffer state (cursor location, folds, etc.)
    set viewdir=~/.vim/tmp/views
    set viewoptions=cursor,folds,unix,slash
    augroup persistence
        au!
        au BufWinLeave * if expand("%") != "" | silent! mkview | endif
        au BufWinEnter * if expand("%") != "" | silent! loadview | endif
    augroup END
" }
" Keymaps {
    " Comma get some... sorry.
    let mapleader = ','
    let maplocalleader = '\'
    noremap ; :
    " Trigger to preserve indentation on pastes
    set pastetoggle=<localleader><localleader>

    " Easier than escape. Pinnacle of laziness.
    imap jj <ESC>

    " Damn you escape key! How I miss you...
    inoremap <F1> <ESC>
    nnoremap <F1> <ESC>
    vnoremap <F1> <ESC>

    " Turn off search highlighting
    noremap <silent> <leader>? :nohlsearch<CR>

    " Navigation {
        " Normalize all the navigation keys to move by row/col despite any
        " wrapped text
        noremap j gj
        noremap k gk
        " % matchit shortcut, but only in normal mode!
        nmap <Tab> %
        " Easier fold toggle
        noremap <Space> za
        " Faster scrolling
        map <C-h> zH
        map <C-j> 5j
        map <C-k> 5k
        map <C-l> zL
        " Navigating buffers
        nnoremap ˙ <C-w>h
        nnoremap ∆ <C-w>j
        nnoremap ˚ <C-w>k
        nnoremap ¬ <C-w>l

        " Ctrl-h: Move word left
        inoremap <c-h> <c-o>b
        " Ctrl-j: Move cursor up
        inoremap <C-j> <Down>
        " Ctrl-k: Move cursor up
        inoremap <C-k> <Up>
        " Ctrl-l: Move word right
        inoremap <c-l> <c-o>w

        " Get used to hjkl!
        noremap <Left> <Nop>
        noremap <Right> <Nop>
        noremap <Down> <Nop>
        noremap <Up> <Nop>

        " f: Find. Also support repeating with .
        nnoremap <Plug>OriginalSemicolon ;
        nnoremap <silent> f :<C-u>call repeat#set("\<lt>Plug>OriginalSemicolon")<CR>f
        nnoremap <silent> t :<C-u>call repeat#set("\<lt>Plug>OriginalSemicolon")<CR>t
        nnoremap <silent> F :<C-u>call repeat#set("\<lt>Plug>OriginalSemicolon")<CR>F
        nnoremap <silent> T :<C-u>call repeat#set("\<lt>Plug>OriginalSemicolon")<CR>T
    " }
    " Editing {
        " Insert-mode navigation
        " Delete a word
        inoremap <C-w> <C-g>u<C-w>
        " Go to end of line
        inoremap <C-e> <Esc>A
        " Delete line
        inoremap <C-u> <C-g>u<C-u>
        " Go to start of line
        inoremap <C-a> <Esc>I

        " Make Y act consistant with C and D
        nnoremap Y y$

        " Don't leave visual mode after indenting
        vnoremap < <gv
        vnoremap > >gv

        " u = undo, U = redo
        nmap U <C-r>

        " Textmate-like CMD+Enter (O in insert mode)
        inoremap <S-CR> <C-O>o
        inoremap <C-S-CR> <C-O>O
        nnoremap <S-CR> o<Esc>
        nnoremap <C-S-CR> O<Esc>

        " Enabling repeat in visual mode
        vmap . :normal .<CR>

        " Reselect pasted text
        nnoremap <leader>v V`]

        " Uses A-Space for generic omnicomplete
        imap <expr> <A-Space>   pumvisible() ? "\<C-n>" : "\<C-x><C-n>"
        imap <expr> <A-S-Space> pumvisible() ? "\<C-p>" : "\<C-x><C-p>"
    " }
    " Buffers {
        " Go to last buffer
        nnoremap <C-b> <C-^>

        " Change CWD to current file's directory
        nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>    

        " Shortcut to vimrc and gvimrc
        nnoremap <localleader>ev :e $HOME/.vimrc<CR>
        nnoremap <localleader>el :e $HOME/.vimrc.local<CR>
        nnoremap <localleader>eb :e $HOME/.vimrc.bundles<CR>
        nnoremap <localleader>eg :e $HOME/.gvimrc<CR>
    " }
    " Command {
        " Annoying command mistakes <https://github.com/spf13/spf13-vim>
        com! -bang -nargs=* -complete=file E e<bang> <args>
        com! -bang -nargs=* -complete=file W w<bang> <args>
        com! -bang -nargs=* -complete=file Wq wq<bang> <args>
        com! -bang -nargs=* -complete=file WQ wq<bang> <args>
        com! -bang Wa wa<bang>
        com! -bang WA wa<bang>
        com! -bang Q q<bang>
        com! -bang QA qa<bang>
        com! -bang Qa qa<bang>
        " Forget to sudo?
        com! WW w !sudo tree % >/dev/null

        " Shortcuts
        cnoremap ;; <C-R>=expand('%:p:h').'/'<CR>
        cnoremap ;. <C-R>=expand("%:t")<CR>
        
        " Mimic shortcuts in the terminal
        cnoremap <C-a> <Home>
        cnoremap <C-e> <End>
    " }
    " Plugins {
        " bufkill {
            " Reopen last closed buffer
            nnoremap <silent> <leader>bz :BUNDO<CR>
        " }
        " CtrlP {
            let g:ctrlp_map = '<leader>.'
            nnoremap <silent> <leader>, :CtrlPBuffer<CR>
            nnoremap <silent> <leader><space> :CtrlPFunky<CR>
            nnoremap <silent> <leader>m :CtrlPMRU<CR>
            nnoremap <silent> <leader>od :CtrlPModified<CR>
            nnoremap <silent> <leader>oD :CtrlPBranch<CR>
            nnoremap <silent> <leader>ot :CtrlPBufTag<CR>
            nnoremap <silent> <leader>oT :CtrlPBufTagAll<CR>
        " }
        " Dispatch {
            nnoremap <localleader>b :Make<CR>
            nnoremap <localleader>B :Dispatch<CR>
        " }
        " NERDTree {
            nnoremap <leader>n :NERDTreeToggle<CR>
            nnoremap <leader>N :NERDTreeFind<CR>
        " }
        " Tabularize {
            nmap <leader>a= :Tabularize /=<CR>
            vmap <leader>a= :Tabularize /=<CR>
            nmap <leader>a> :Tabularize /=><CR>
            vmap <leader>a> :Tabularize /=><CR>
            nmap <leader>a: :Tabularize /:<CR>
            vmap <leader>a: :Tabularize /:<CR>
            nmap <leader>a:: :Tabularize /:\zs<CR>
            vmap <leader>a:: :Tabularize /:\zs<CR>
            nmap <leader>a, :Tabularize /,<CR>
            vmap <leader>a, :Tabularize /,<CR>
            nmap <leader>a<Bar> :Tabularize /<Bar><CR>
            vmap <leader>a<Bar> :Tabularize /<Bar><CR>
        " }
        " TComment {
            map <silent> <leader>/ gcc
            vmap <silent> <leader>/ gc
        " }
        " UltiSnips {
            let g:UltiSnipsExpandTrigger = "<Tab>"
            let g:UltiSnipsJumpForwardTrigger = "<Tab>"
            let g:UltiSnipsJumpBackwardTrigger = "<S-Tab>"
        " }
    " }
    " Debug {
        map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                    \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                    \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
    " }
" }
" Commands {
    " Strip whitespace
    com! Trim %s/\s\+$//

    func! HtmlSpecialChars()
ruby << EOF
    @str=VIM::Buffer.current.line
    VIM::Buffer.current.line=@str.unpack("U*").collect {|s| (s > 127 ? "&##{s};" : s.chr) }.join("")
EOF
    endfunc

source $HOME/.vim/rc/backup
source $HOME/.vim/rc/keymaps
source $HOME/.vim/rc/util

" A local rc file separate from this distro.
try source $HOME/.vimrc.local catch endtry

" vim:set fmr={,} fdl=0 fdm=marker:
