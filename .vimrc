" My Little Vim {
"    __  __ _  __     _____ __  __ 
"   |  \/  | | \ \   / /_ _|  \/  |
"   | |\/| | |  \ \ / / | || |\/| |
"   | |  | | |___\ V /  | || |  | |
"   |_|  |_|_____|\_/  |___|_|  |_|
"                                                       
"   Author: Henrik Lissner
"   Url: http://github.com/hlissner/mlvim
"
"   A vimrc for any web designer, developer or masochist. We all know they're
"   all the same thing. Many of these settings, if not by me, were inspired 
"   from too many places to list.
"
"   This will import .[g]vimrc.local files!
"
" }

" Environment {{
    set nocompatible
    set shell=/bin/zsh
    set wildignore+=.*,*.cache,cache/**,*~,*.swp,*.log,.sass-cache,__*

    " Vundle {{
        set rtp+=~/.vim/bundle/vundle
        call vundle#rc()
    " }}

    " Utilities {{
        " Reveal syntax highlighting group under cursor
        nmap <C-S-P> :call <SID>SynStack()<CR>
        function! <SID>SynStack()
            if !exists("*synstack")
                return
            endif
            echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
        endfunction
    " }}
" }}

" Bundles {{
    Bundle 'gmarik/vundle'

    " Deps
    Bundle 'MarcWeber/vim-addon-mw-utils.git'
    Bundle 'mileszs/ack.vim'
    Bundle 'tomtom/tlib_vim.git'

    " Local bundles, if available
    if filereadable(expand("~/.vimrc.bundles.local"))
        source ~/.vimrc.bundles.local
    endif

    " General
    Bundle 'Lokaltog/vim-easymotion'
    Bundle 'Lokaltog/vim-powerline'
    Bundle 'bufkill.vim'
    Bundle 'danro/rename.vim'
    Bundle 'ervandew/supertab'
    Bundle 'kien/ctrlp.vim'
    Bundle 'lilydjwg/colorizer'
    Bundle 'majutsushi/tagbar'
    Bundle 'matchit.zip'
    Bundle 'nathanaelkane/vim-indent-guides'
    Bundle 'scrooloose/nerdtree'
    Bundle 'sessionman.vim'
    Bundle 'tpope/vim-repeat'
    Bundle 'tpope/vim-surround'
    Bundle 'tpope/vim-unimpaired'

    " Programming {{
        Bundle 'xolox/vim-easytags'
        Bundle 'Raimondi/delimitMate'
        Bundle 'garbas/vim-snipmate.git'
        Bundle 'godlygeek/tabular'
        Bundle 'scrooloose/nerdcommenter'
        Bundle 'tomtom/checksyntax_vim'
        Bundle 'tpope/vim-fugitive'
        Bundle 'tpope/vim-endwise'
        
        " PHP
        Bundle 'spf13/PIV'
        " Python
        Bundle 'klen/python-mode'
        Bundle 'indentpython.vim--nianyang'
        Bundle 'python.vim'
        Bundle 'python_match.vim'
        Bundle 'pythoncomplete'
        " Javascript
        Bundle 'leshill/vim-json'
        Bundle 'taxilian/vim-web-indent'
        " HTML
        Bundle 'ervandew/sgmlendtag'
        Bundle 'kogakure/vim-sparkup'
        Bundle 'tpope/vim-ragtag'
        " CSS/SCSS/LESS
        Bundle 'cakebaker/scss-syntax.vim'
        Bundle 'groenewege/vim-less'
        " Ruby
        Bundle 'rails.vim'
        " Other
        Bundle 'PickAColor.vim'
        Bundle 'kchmck/vim-coffee-script'
        Bundle 'spf13/vim-markdown'
        Bundle 'spf13/vim-preview'
    " }}
    
    filetype plugin indent on
" }}

" My Settings {{
    scriptencoding utf-8
    
    set background=dark
    set mouse=a

    set clipboard+=unnamed
    set shortmess+=filmnrxoOtT
    set virtualedit=onemore
    set hidden
    set nospell                 " No spell check, please

    " Don't update screen while running macros
    set lazyredraw

    " Off with the bells
    set vb

    " Backups, swapfiles, persistence {{
        " No backup (that's what git is for!) and swapfiles are just annoying
        set noswapfile
        set nobackup

        set viewdir=~/.vim/tmp/views
        set undodir=~/.vim/tmp/undo
        if !isdirectory("~/.vim/tmp")
            " Set up temp folders
            silent execute '!mkdir -p ~/.vim/tmp/views'
            silent execute '!mkdir -p ~/.vim/tmp/undo'
        endif

        " Persistent undo
        set undofile
        set undolevels=1000
        set undoreload=1000
        set history=1000

        " Buffer persistence
        set viewoptions=cursor,folds,unix,slash
        au BufWinLeave * if expand("%") != "" | mkview | endif
        au BufWinEnter * if expand("%") != "" | loadview | endif
    " }}
    
    " Editor {{
        syntax on
        color wombat256

        set number                          " Show line numbers
        set cursorline                      " Highlight line
        set nolist                          " Don't show tabs (indent-guides does it nicer)

        set wildmenu                        " Show menu instead of auto-complete
        set wildmode=list:longest,full      " command <Tab> completion: list matches -> longest common -> then all
        set whichwrap=b,s,h,l,<,>,[,]       " Backspace and cursor keys to wrap
        set tabpagemax=15                   " Only show 15 tabs
        set showmode                        " Display current mode
        set backspace=indent,eol,start      
        set linespace=0                     " Number of pixels between lines

        set scrolljump=10 scrolloff=5       
        set splitbelow splitright           " Default split buffer positioning

        " Search                            
        set showmatch                       " Show matching delimiters
        set incsearch                       " find as you type
        set hlsearch                        " Highlight search terms
        set ignorecase                      " case insensitive search
        set smartcase                       " case sensitive when uc present
        set gdefault                        " global flag for substitute by default

        if has('cmdline_info')
            set ruler
            set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
            set showcmd
        endif

        if has('statusline')
            set laststatus=2
            
            " Broken down into easily includeable segments
            set statusline=%<%f\                     " Filename
            set statusline+=%w%h%m%r                 " Options
            set statusline+=%{fugitive#statusline()} " Git Hotness
            set statusline+=\ [%{&ff}/%Y]            " filetype
            set statusline+=\ [%{getcwd()}]          " current dir
            set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
        endif
    " }}

    " Formatting {{
        set nowrap
        set autoindent
        set shiftround
        set expandtab
        set shiftwidth=4
        set tabstop=4
        set softtabstop=4

        set pastetoggle=<F2>        " Trigger to preserve indentation on pastes

        " Folding {{
            set foldenable

            " Cleaner, readable fold headers
            set foldtext=MyFoldText()
            function! MyFoldText()
                let indent_level = indent(v:foldstart)
                let indent = repeat(' ',indent_level-2)
                let nl = v:foldend - v:foldstart + 1
                let comment = substitute(getline(v:foldstart),"^ *","",1)
                let text = comment . ' ... [' . nl . ']'
                if indent_level <= 0
                    return indent . text
                else
                    return '+ ' . indent . text
                endif
            endfunction

            " Turn off folding while in insert mode (helps snappiness)
            au InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
            au InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
            
            " Restore some folding powers!
            au FileType vim set foldmarker={{,}}
            au FileType vim,css,scss,less set foldmethod=marker
            au FileType css,scss,less set foldmarker={,}
        " }}
    " }}

    " Keymappings {{
        " Comma get some... sorry.
        let mapleader = ','
        noremap ; :
        " Restore ; and , functionality
        noremap [; ,
        noremap ]; ;
        
        " Easier than escape. Pinnacle of laziness.
        imap jj <ESC>
        " Damn you escape key! How I miss you... literally.
        inoremap <F1> <ESC>
        nnoremap <F1> <ESC>
        vnoremap <F1> <ESC>

        " Fold toggle
        nnoremap <space> za

        " Turn off highlighting (when you're done)
        noremap <silent> <leader>? :nohlsearch<CR>

        " Navigation {{
            nnoremap j gj
            nnoremap k gk
            map <C-j> 5j
            map <C-k> 5k
            
            " Obey! You will get used to hjkl! (You can still use 'em in
            " insert mode though)
            nnoremap <Left> <Nop>
            nnoremap <Right> <Nop>
            nnoremap <Down> <Nop>
            nnoremap <Up> <Nop>
        " }}
        
        " Editing {{
            " EOL-yank, consistent with C and D
            nnoremap Y y$
            " Don't leave mode while...
            vnoremap < <gv
            vnoremap > >gv
            " Moving lines around
            nnoremap <C-Down> mz:m+<CR>`z
            nnoremap <C-Up> mz:m-2<CR>`z
            vnoremap <C-Down> :m'>+<CR>`<my`>mzgv`yo`z
            vnoremap <C-Up> :m'<-2<CR>`>my`<mzgv`yo`z
            
            " Skip to or past the nearest closing braces/brackets while in
            " Insert mode.
            inoremap <silent> <C-Space> <Esc>/[})\]]<CR>:nohl<CR>a
            inoremap <silent> <C-S-Space> <Esc>?[{(\[]<CR>:nohl<CR>i
            " Textmate-like CMD+Enter (O in insert mode)
            inoremap <C-CR> <C-O>o
            inoremap <C-S-CR> <C-O>O

            " Toggle commenting of current line
            map <silent> <leader>/ <leader>c<space>

            " Folding {{
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
            " }}
        " }}

        " Buffers {{
            nnoremap <leader>ev :e ~/.vimrc<CR>
            nnoremap <leader>eg :e ~/.gvimrc<CR>

            " Moving between tabs
            nnoremap <silent> <C-left> :bprev<CR>
            nnoremap <silent> <C-right> :bnext<CR>
        " }}
        
        " External {{
            if has('macunix')
                " Send to Launchbar
                nnoremap <silent> <leader>opl :!open -a Launchbar %<CR>
                " Open terminal here (switch iTermHere to Terminal, if you don't use iTerm)
                nnoremap <silent> <leader>opt :!open -a iTermHere %<CR>

                " Open folder in Finder
                nnoremap <silent> <leader>of :!open %:p:h<CR>
                " Send current file's folder (NOT PWD) to launchbar
                nnoremap <silent> <leader>ol :!open -a Launchbar "%:p:h"<CR>
                " Open a terminal CD'd to the current file's folder
                nnoremap <silent> <leader>ot :!open -a iTermHere "%:p:h"<CR>

                " Send file to transmit for upload (dropsend)
                noremap <silent> <leader>ou :!open -a Transmit %<CR>
            endif
        " }}
        
        " Command Shortcuts {{
            " Annoying command mistakes
            com! W w
            com! Q q
            com! WQ wq
            " Forget to sudo? (Thanks spf13)
            cmap w!! w !sudo tree % >/dev/null
            
            " Shortcuts
            cnoremap %% <C-R>=expand('%:h').'/'<cr>
            cnoremap %r <C-R>=expand('%').'/'<cr>

            com! StripTags :%s/<\_.\{-1,\}>//g<CR>
            " Strip whitespace
            com! Trim :call setline(1,map(getline(1,"$"),'substitute(v:val,"\\s\\+$","","")'))
        " }}
    " }}

    " Filetypes {{
        au BufNewFile,BufRead *.twig setf htmljinja
    " }}
" }}

" Plugins {{
    let b:match_ignorecase = 1

    " Colorizer {{
        let g:colorizer_nomap = 1
        nmap <leader>ct <Plug>Colorizer
    " }}
    
    " CTags {{
        set tags=./.tags;/,~/.tags
    " }}

    " Ctrip {{
        let g:ctrlp_map = '<leader>t'
        let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix']
        let g:ctrlp_max_height = 10
        let g:ctrlp_cache_dir = "~/.vim/tmp/ctrip"
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$\|\.dll$' }

        nnoremap <silent> <leader>bt :CtrlPBuffer<CR>
        nnoremap <silent> <leader>br :CtrlPTag<CR>
        nnoremap <silent> <leader>bm :CtrlPMRU<CR>
    " }}

    " delimitMate {{
        let g:delimitMate_expand_cr = 1
        let g:delimitMate_expand_space = 1
    " }}

    " EasyTags {{
        let g:easytags_cmd = 'ctags'
        let g:easytags_file = '~/.vim/tmp/tags'
        let g:easytags_dynamic_files = 1
    " }}
    
    " Fugitive {{
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR> 
    " }}

    " NERDCommenter {{
        let g:NERDShutUp = 1
        let g:NERDCustomDelimiters = {
            \ 'less': { 'left': '//' },
            \ 'scss': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
            \ 'html': { 'left': '<!--', 'right': '-->' },
            \ 'htmljinja': { 'left': '{#', 'right': '#}' }
        \ }
    " }}

    " NERDTree {{
        let NERDTreeMinimalUI = 1
        nnoremap <leader>n/ :NERDTreeToggle<CR>
        nnoremap <leader>n. :NERDTreeFind<CR>
        
        let NERDTreeChDirMode=0
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr']
        let NERDTreeKeepTreeInNewTab=0
        let NERDTreeQuitOnOpen=1
        let NERDTreeShowBookmarks=0
        let NERDTreeShowHidden=1
    " }}

    " OmniComplete {{
        if has("autocmd") && exists("+omnifunc")
            autocmd Filetype *
                \if &omnifunc == "" |
                \setlocal omnifunc=syntaxcomplete#Complete |
                \endif
        endif

        " Some convenient mappings (thanks spf13)
        inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
        inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
        inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
        inoremap <expr> <C-d>      pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<C-d>"
        inoremap <expr> <C-u>      pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<C-u>"
        
        " Enable omni completion.
        autocmd FileType css,scss,less setlocal omnifunc=csscomplete#CompleteCSS
        autocmd FileType html,markdown,htmljinja,xml setlocal omnifunc=htmlcomplete#CompleteTags
        autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
        autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

        au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif 
        set completeopt=menu,preview,longest
    " }}

    " PickAColor {{
        nnoremap <leader>p# :PickHEX<CR>
        nnoremap <leader>pr :PickRGB<CR>
        nnoremap <leader>ph :PickHSL<CR>
    " }}
    
    " PIV {{
        " Just my coding preference
        let g:PIVPearStyle = 0
        let g:PHP_autoformatcomment = 1

        " Disable PIV's auto folding (preserves my nice foldtext function)
        let g:DisableAutoPHPFolding = 1
        " DelimitMate handles autoclosing delimiters for us, so disable PIV's
        let g:PIVAutoClose = 0
    " }}
    
    " PythonMode {{
        let g:pymode_lint_checker = 'pyflakes'
        if !has('python')
            let g:pymode = 1
        endif
    " }}

    " Rename {{
        com! R Rename
    " }}

    " Session List {{
        set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
    " }}

    " SuperTab {{
        let g:SuperTabDefaultCompletionType        = "context"
        "let g:SuperTabContextDefaultCompletionType = "<C-x><C-o>"

        " You MUST turn off CR keymaps in order for SuperTab to work with
        " DelimitMate's Car returns. It also disrupts Endwise.
        let g:SuperTabCrMapping = 0
    " }}
    
    " SparkUp {{ 
        au FileType htmljinja source ~/.vim/bundle/vim-sparkup/ftplugin/html/sparkup.vim
    " }}

    " Tabularize {{
        nmap <Leader>a= :Tabularize /=<CR>
        vmap <Leader>a= :Tabularize /=<CR>
        nmap <Leader>a: :Tabularize /:<CR>
        vmap <Leader>a: :Tabularize /:<CR>
        nmap <Leader>a:: :Tabularize /:\zs<CR>
        vmap <Leader>a:: :Tabularize /:\zs<CR>
        nmap <Leader>a, :Tabularize /,<CR>
        vmap <Leader>a, :Tabularize /,<CR>
        nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
    " }}
    
    " TagBar {{
        nnoremap <silent> <leader>T :TagbarToggle<CR>
    " }}

    " Vim-indent-guides {{
        let g:indent_guides_enable_on_vim_startup = 1
        let g:indent_guides_start_level           = 2
        let g:indent_guides_guide_size            = 1
        let g:indent_guides_auto_colors           = 0
    " }}

    " snipMate {{
        " Extends snippets between languages that are essentially the same
        let g:snipMate = {}
        let g:snipMate.scope_aliases = {
            \ 'htmljinja': 'html,htmljinja',
            \ 'scss': 'css,scss',
            \ 'less': 'css,less' }
    " }}
" }}

" Import local vmrc, if available {{
    if filereadable(expand("~/.vimrc.local"))
        source ~/.vimrc.local
    endif
" }}

" vim: set foldmarker={{,}} foldlevel=0 foldmethod=marker
