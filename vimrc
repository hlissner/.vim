" My Little Vim {
"
"   Author: Henrik Lissner
"   Url: http://github.com/hlissner/mlvim
"
"   A vimrc for any web designer, developer or masochist. We all know they're
"   the same thing.
"
" }

set nocompatible
scriptencoding utf-8
au!

" Plugins {
    set runtimepath+=~/.vim/bundle/vundle
    call vundle#rc()

    " Plugins {
        Bundle 'gmarik/vundle'

        " General {
            Bundle 'Lokaltog/vim-powerline'
            Bundle 'PickAColor.vim'
            Bundle 'Raimondi/delimitMate'
            Bundle 'YankRing.vim'
            Bundle 'bufkill.vim'
            Bundle 'chrisbra/color_highlight'
            Bundle 'godlygeek/tabular'
            Bundle 'kien/ctrlp.vim'
            Bundle 'matchit.zip'
            Bundle 'mileszs/ack.vim'
            Bundle 'nathanaelkane/vim-indent-guides'
            Bundle 'scrooloose/nerdtree'
            Bundle 'scrooloose/syntastic'
            Bundle 'tomtom/tcomment_vim'
            Bundle 'tpope/vim-endwise'
            Bundle 'tpope/vim-fugitive'
            Bundle 'tpope/vim-repeat'
            Bundle 'tpope/vim-speeddating'
            Bundle 'tpope/vim-surround'
            Bundle 'tpope/vim-unimpaired'
            Bundle 'hlissner/vim-multiedit'
            Bundle 'hlissner/vim-transmitty'

            if executable('ctags')
                Bundle 'majutsushi/tagbar'
                Bundle 'xolox/vim-easytags'
            endif

            if has("python")
                Bundle 'Valloric/YouCompleteMe'
                Bundle 'SirVer/ultisnips'
            endif
        " }

        " Syntaxes {
            " PHP
            Bundle 'hlissner/PIV'
            Bundle 'arnaud-lb/vim-php-namespace'
            Bundle 'beyondwords/vim-twig'
            " PHP.laravel
            Bundle 'johnhamelink/blade.vim'

            " Python
            Bundle 'indentpython.vim--nianyang'
            Bundle 'klen/python-mode'
            Bundle 'python_match.vim'
            Bundle 'pythoncomplete'

            " Javascript
            Bundle 'leshill/vim-json'
            Bundle 'mmalecki/vim-node.js'
            Bundle 'pangloss/vim-javascript'

            " HTML
            Bundle 'tristen/vim-sparkup'
            Bundle 'digitaltoad/vim-jade'

            " CSS/SCSS/LESS
            Bundle 'cakebaker/scss-syntax.vim'
            Bundle 'groenewege/vim-less'

            " Ruby
            Bundle 'rails.vim'

            " Objective-C / Clang
            Bundle 'b4winckler/vim-objc'
            Bundle 'eraserhd/vim-ios.git'

            " Other
            Bundle 'spf13/vim-markdown'
            Bundle 'spf13/vim-preview'
        " }

        " Colorschemes {
            Bundle 'tomasr/molokai'
        " }
    " }

    " Settings {
        " Ctrip {
            let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'line', 'changes']

            let g:ctrlp_max_height = 12
            let g:ctrlp_cache_dir = "~/.vim/tmp/ctrip"
            let g:ctrlp_working_path_mode = 0
            let g:ctrlp_custom_ignore = {
                \ 'dir':  '\.git$\|\.hg$\|\.svn|\.settings$',
                \ 'file': '\.exe$\|\.so$\|\.dll|\.sass\-cache|\.classpath|\.project$' }
        " }

        " delimitMate {
            let g:delimitMate_expand_cr = 1
            let g:delimitMate_expand_space = 1
        " }

        " EasyTags {
            let g:easytags_cmd = 'ctags'
            let g:easytags_dynamic_files = 1
            let g:easytags_by_filetype = "~/.vim/tmp/tags"
            let g:easytags_updatetime_autodisable = 1
        " }

        " NERDTree {
            let NERDTreeMinimalUI=1

            let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.settings', '\.project', '\.DS_Store']
            let NERDTreeQuitOnOpen=0
            let NERDTreeShowBookmarks=0
            let NERDTreeShowHidden=1
            let NERDTreeAutoDeleteBuffer=1
        " }

        " PIV {
            " Just my coding preference
            let g:PIVPearStyle = 0
            let g:PHP_autoformatcomment = 0

            " Disable PIV's auto folding (preserves my nice foldtext function)
            let g:DisableAutoPHPFolding = 1
            " DelimitMate handles autoclosing delimiters for us, so disable PIV's
            let g:PIVAutoClose = 0
        " }

        " Powerline {
            let g:Powerline_mode_n = 'N'
            let g:Powerline_mode_i = 'I'
            let g:Powerline_mode_v = 'V'
            let g:Powerline_mode_V = 'V-'
            let g:Powerline_mode_cv = 'V+'
            let g:Powerline_mode_R = 'R'
        " }

        " PythonMode {
            let g:pymode_run = 0
            let g:pymode_lint_checker = 'pyflakes'

            if !has('python')
                let g:pymode = 1
            endif
        " }

        " SparkUp {
            au FileType blade,twig,xml so ~/.vim/bundle/vim-sparkup/ftplugin/html/sparkup.vim
        " }

        " Syntastic {
            let g:syntastic_enable_highlighting = 0
            let g:syntastic_auto_loc_list=1
            let g:syntastic_quiet_warnings=1
            let g:syntastic_phpcs_disable=1
        " }

        " TComment {
            let g:tcomment_types = {}
            let g:tcomment_types['blade'] = '{-- %s --}'
            let g:tcomment_types['twig'] = '{# %s #}'
        " }

        " UltiSnips {
            let g:UltiSnipsSnippetDirectories = ['snippets']
        " }

        " Vim-indent-guides {
            let g:indent_guides_enable_on_vim_startup = 1
            let g:indent_guides_start_level           = 2
            let g:indent_guides_guide_size            = 1
            " let g:indent_guides_auto_colors           = 1
            let g:indent_guides_color_change_percent  = 4
        " }
        
        " YankRing {
            let g:yankring_history_dir = '~/.vim/tmp/yankring'
        " }
    " }

    " Have you own local settings. Great for sharing vim configs across
    " different computers.
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif

    filetype plugin indent on
" }

" Preferences {
    syntax on
    set background=dark
    colorscheme molokai

    set laststatus=2             " Show statusbar
    set nolist                   " Don't show tabs (indent-guides does it nicer)
    set nospell                  " No spell check, please
    set number                   " Line numbers
    set visualbell               " No sounds!
    set noshowmode
    set showmatch                " Show matching delimiters
    set browsedir=buffer         " Sets File>Open to start in current file's path

    if has('cmdline_info')
        set ruler                " Show line/col no in statusline
        set showcmd              " Show command issued
    endif

    " Search {
        set incsearch            " find as you type
        set hlsearch             " Highlight search terms
        set ignorecase           " case insensitive search
        set smartcase            " case sensitive when uc present
        set gdefault             " global flag for substitute by default
    " }

    " Behavior {
        set synmaxcol=1024
        syntax sync minlines=256

        set backspace=indent,eol,start
        set mouse=a
        set lazyredraw           " Don't update screen while running macros
        set hidden               " Hide abandoned buffers
        set nostartofline

        set clipboard+=unnamed
        set shortmess+=filmnrxoOtTs
        set scrolloff=5
    " }

    " Omnicomplete {
        set tags=./.tags;/,~/.tags,~/tags

        set completeopt=longest,menu,preview
        set wildmenu                    " Show menu instead of auto-complete
        set wildmode=list:longest,full  " command <Tab> completion: list
                                        " matches -> longest common -> then
                                        " all.
        set wildignore+=.*,*.cache,cache/**,*~,*.swp,*.log,.sass-cache,__*,*.class

        augroup vim_omnicomplete
            au!
            if exists("+omnifunc")
                au Filetype *
                    \if &omnifunc == "" |
                    \   setl omnifunc=syntaxcomplete#Complete |
                    \endif
            endif

            " Enable omni completion.
            au FileType css,scss,less setl omnifunc=csscomplete#CompleteCSS
            au FileType html,markdown,htmljinja,xml setl omnifunc=htmlcomplete#CompleteTags
            au FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
            au FileType python setl omnifunc=pythoncomplete#Complete
            au FileType xml setl omnifunc=xmlcomplete#CompleteTags
        augroup END
    " }

    " Formatting {
        set autoindent
        set shiftround
        set expandtab
        set shiftwidth=4
        set tabstop=4
        set softtabstop=4

        " Trigger to preserve indentation on pastes
        set pastetoggle=<localleader>p

        " Wrapping {
            set nowrap
            " Backspace and cursor keys to wrap
            set whichwrap=b,s,h,l,<,>,[,]
            set textwidth=79
            set colorcolumn=85
            
            " see :h fo-table
            set formatoptions=qron1l
        " }
    " }

    " Folding {
        " set foldenable
        set foldlevel=1

        " Cleaner, readable fold headers
        set foldtext=MyFoldText()
        func! MyFoldText()
            let indent_level = indent(v:foldstart)
            let indent = repeat(' ',indent_level-2)
            let nl = v:foldend - v:foldstart + 1
            let comment = substitute(getline(v:foldstart),"^ *","",1)
            let text = comment . ' … [' . nl . ']'
            if indent_level <= 0
                return indent . text
            else
                return '+ ' . indent . text
            endif
        endfunc
    " }

    " Backups, swapfiles, persistence {
        set undodir=~/.vim/tmp/undo
        set viewdir=~/.vim/tmp/views
        if !isdirectory("~/.vim/tmp")
            silent exec "!mkdir -p ~/.vim/tmp/undo"
            silent exec "!mkdir -p ~/.vim/tmp/views"
        endif

        " No backup (that's what git is for!) and swapfiles are annoying
        set nobackup
        set noswapfile

        set undofile
        set undolevels=500
        set undoreload=500
        set history=1000

        " Preserve buffer state (cursor location, folds, etc.)
        set viewoptions=cursor,folds,unix,slash
        augroup persistence
            au!
            au BufWinLeave * if expand("%") != "" | mkview | endif
            au BufWinEnter * if expand("%") != "" | loadview | endif
        augroup END
    " }
" }

" Keymappings {
    " Comma get some... sorry.
    let mapleader = ','
    let maplocalleader = '\'
    noremap ; :

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

        " Easier horizontal scrolling
        map zl zL
        map zh zH

        " Get used to hjkl!
        noremap <Left> <Nop>
        noremap <Right> <Nop>
        noremap <Down> <Nop>
        noremap <Up> <Nop>

        " Tab alias for matchit
        nmap <Tab> %
    " }

    " Editing {
        " Fold toggle
        nnoremap <Space> za

        " Make Y act consistant with C and D
        nnoremap Y y$

        " Don't leave visual mode after indenting
        vnoremap < <gv
        vnoremap > >gv

        " One-key indent control
        nmap ≥ >>
        nmap ≤ <<

        " Textmate-like CMD+Enter (O in insert mode)
        inoremap <S-CR> <C-O>o
        inoremap <C-S-CR> <C-O>O
        nnoremap <S-CR> o<Esc>
        nnoremap <C-S-CR> O<Esc>

        " Enabling repeat in visual mode
        vmap . :normal .<CR>

        " Reselect pasted text
        nnoremap <leader>v V`]

        " Easier reformats
        nnoremap <leader>q gqip
        vnoremap <leader>q gq

        " Uses A-Space for generic omnicomplete
        imap <expr> <A-Space>   pumvisible() ? "\<C-n>" : "\<C-x><C-n>"
        imap <expr> <S-A-Space> pumvisible() ? "\<C-p>" : "\<C-x><C-p>"

        " Add semicolon to end of line
        nnoremap <leader>; ma$a;<Esc>`a

        " Adjust folding level
        nmap <leader>f0 :set foldlevel=0<CR>
        nmap <leader>f1 :set foldlevel=1<CR>
        nmap <leader>f2 :set foldlevel=2<CR>
        nmap <leader>f3 :set foldlevel=3<CR>
        nmap <leader>f4 :set foldlevel=4<CR>
        nmap <leader>f5 :set foldlevel=5<CR>
        nmap <leader>f6 :set foldlevel=6<CR>
        nmap <leader>f7 :set foldlevel=7<CR>
        nmap <leader>f8 :set foldlevel=8<CR>
        nmap <leader>f9 :set foldlevel=9<CR>
    " }

    " Buffers {
        " Switch between open buffers
        noremap <C-Tab> :bnext<CR>
        noremap <C-S-Tab> :bprev<CR>

        " Jump between buffers
        nnoremap <C-h> <C-w>h
        nnoremap <C-j> <C-w>j
        nnoremap <C-k> <C-w>k
        nnoremap <C-l> <C-w>l

        " Make vertical split and move into it
        nnoremap <C-w>v <C-w>v<C-w>l
        nnoremap <C-w>N :vnew<CR>

        " Shortcut to vimrc and gvimrc
        nnoremap <leader>ev :e ~/.vimrc<CR>
        nnoremap <leader>eg :e ~/.gvimrc<CR>

        " Temporary session management
        let SESSDIR = "~/.vim/tmp/session.vim"
        nnoremap <leader>ss :w<CR>:mksession! <C-R>=SESSDIR<CR><CR>
        nnoremap <leader>sl :so <C-R>=SESSDIR<CR><CR>
        nnoremap <leader>sd :!rm <C-R>=SESSDIR<CR><CR>
    " }

    " Command {
        " Annoying command mistakes
        com! W w 
        com! Q q
        com! WQ wq
        " Forget to sudo? (Thanks spf13)
        com! WW w !sudo tree % >/dev/null

        " Shortcuts
        cnoremap %% <C-R>=expand('%:p:h').'/'<CR>
        cnoremap %r <C-R>=expand('%')<CR>
        cnoremap %. <C-R>=expand("%:t")<CR>
        cnoremap !! <C-R>="!".&filetype." "<CR>
        
        " Strip whitespace
        com! -range Trim <line1>,<line2>s/\s\+$//
    " }
    
    " Plugins {
        " Ctrlp {
            let g:ctrlp_map = '<leader>.'
            nnoremap <silent> <leader>, :CtrlPBuffer<CR>
            nnoremap <silent> <leader>tr :CtrlPTag<CR>
            nnoremap <silent> <leader>tm :CtrlPMRU<CR>
            nnoremap <silent> <leader>tl :CtrlPLine<CR>
            nnoremap <silent> <leader>tc :CtrlPChangeAll<CR>
            nnoremap <silent> <leader>tc. :CtrlPChange<CR>
        " }

        " Fugitive {
            nnoremap <silent> <leader>gs :Gstatus<CR>
            nnoremap <silent> <leader>gd :Gdiff<CR>
            nnoremap <silent> <leader>gc :Gcommit<CR>
            nnoremap <silent> <leader>gb :Gblame<CR>
            nnoremap <silent> <leader>gl :Glog<CR>
            nnoremap <silent> <leader>gp :Git push<CR>
            nnoremap <silent> <leader>gw :Gwrite<CR>
        " }

        " NERDTree {
            nnoremap <leader>n :NERDTreeToggle<CR>
            nnoremap <leader>N :NERDTreeFind<CR>
        " }
        
        " PhpNamespaces {
            imap <buffer> <Leader>u <C-O>:call PhpInsertUse()<CR>
            map <buffer> <Leader>u :call PhpInsertUse()<CR> 

            imap <buffer> <Leader>e <C-O>:call PhpExpandClass()<CR>
            map <buffer> <Leader>e :call PhpExpandClass()<CR>
        " }

        " Tabularize {
            nmap <leader>a= :Tabularize /=<CR>
            vmap <leader>a= :Tabularize /=<CR>
            nmap <leader>a: :Tabularize /:<CR>
            vmap <leader>a: :Tabularize /:<CR>
            nmap <leader>a:: :Tabularize /:\zs<CR>
            vmap <leader>a:: :Tabularize /:\zs<CR>
            nmap <leader>a, :Tabularize /,<CR>
            vmap <leader>a, :Tabularize /,<CR>
            nmap <leader>a<Bar> :Tabularize /<Bar><CR>
            vmap <leader>a<Bar> :Tabularize /<Bar><CR>
        " }

        " TagBar {
            nnoremap <silent> <leader>r :TagbarToggle<CR>
        " }

        " TComment {
            map <silent> <leader>/ gcc
            vmap <silent> <leader>/ gc
        " }

        " UltiSnips {
            " let g:UltiSnipsExpandTrigger = "<tab>"
            " let g:UltiSnipsJumpForwardTrigger = "<tab>"
            " let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"
            
            " Temporary settings until YouCompleteMe incorporates ultisnips support
            let g:UltiSnipsExpandTrigger = "<C-f>"
            let g:UltiSnipsJumpForwardTrigger = "<C-j>"
            let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
        " }
        
        " YankRing {
            nnoremap <leader>p :YRShow<CR>
            nnoremap <leader>y/ :YRSearch<CR>
        " }
    " }
" }

" Uility {
    " Reveal syntax highlighting group under cursor
    func! <SID>SynStack()
        if exists("*synstack")
            echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
        endif
    endfunc

    nmap ~ :call <SID>SynStack()<CR>
" }

" vim: set foldmarker={,} foldlevel=0 foldmethod=marker
