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
"   the same thing. Many of these settings, if not by me, were inspired
"   from too many places to list.
"
"   This hasn't been tested on windows!
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
scriptencoding utf-8
au!

" Vundle {{
    set rtp+=~/.vim/bundle/vundle
    call vundle#rc()

    " Bundles {{
        Bundle 'gmarik/vundle' 

        " General {{
            Bundle 'matchit.zip'
            Bundle 'bufkill.vim'
            Bundle 'buftabs'
            Bundle 'Lokaltog/vim-powerline'
            Bundle 'Raimondi/delimitMate'
            Bundle 'godlygeek/tabular'
            Bundle 'kien/ctrlp.vim'
            Bundle 'mileszs/ack.vim'
            Bundle 'nathanaelkane/vim-indent-guides'
            Bundle 'scrooloose/nerdcommenter'
            Bundle 'scrooloose/nerdtree'
            Bundle 'scrooloose/syntastic'
            Bundle 'tpope/vim-abolish'
            Bundle 'tpope/vim-endwise'
            Bundle 'tpope/vim-fugitive'
            Bundle 'tpope/vim-pastie'
            Bundle 'tpope/vim-ragtag'
            Bundle 'tpope/vim-repeat'
            Bundle 'tpope/vim-speeddating'
            Bundle 'tpope/vim-surround'
            Bundle 'tpope/vim-unimpaired'
            Bundle 'xolox/vim-easytags'

            Bundle 'PickAColor.vim'
            Bundle 'lilydjwg/colorizer'
            Bundle 'majutsushi/tagbar'

            if has("python")
                Bundle 'SirVer/ultisnips'
            endif

            if has("ruby")
                Bundle 'LustyJuggler'
                Bundle 'LustyExplorer'
            endif
        " }}

        " Syntaxes {{
            " PHP
            Bundle 'spf13/PIV'
            Bundle 'techlivezheng/tagbar-phpctags.git'
            Bundle 'beyondwords/vim-twig'
            " PHP.laravel
            Bundle 'johnhamelink/blade.vim'

            " Python
            Bundle 'indentpython.vim--nianyang'
            Bundle 'klen/python-mode'
            Bundle 'python_match.vim'
            Bundle 'pythoncomplete'

            " Javascript
            Bundle 'bloveridge/jslint.vim'
            Bundle 'leshill/vim-json'
            Bundle 'taxilian/vim-web-indent'

            " HTML
            Bundle 'ervandew/sgmlendtag'
            Bundle 'kogakure/vim-sparkup'

            " CSS/SCSS/LESS
            Bundle 'cakebaker/scss-syntax.vim'
            Bundle 'groenewege/vim-less'

            " Ruby
            Bundle 'rails.vim'

            " Java
            Bundle 'pwicks86/eclim-for-vundle'

            " Other
            Bundle 'kchmck/vim-coffee-script'
            Bundle 'spf13/vim-markdown'
            Bundle 'spf13/vim-preview'
            Bundle 'mediawiki.vim'
        " }}

        " Misc {{
            Bundle 'tomasr/molokai'
        " }}

        filetype plugin indent on
    " }}
" }}

" Preferences {{
    syntax on
    colorscheme molokai
    set background=dark
    set synmaxcol=512

    set cursorline               " Highlight current line
    set laststatus=2             " Show statusbar
    set nolist                   " Don't show tabs (indent-guides does it nicer)
    set nospell                  " No spell check, please
    set number                   " Line numbers
    set ruler                    " Show line/col no in statusline
    set showcmd                  " Show command issued
    set visualbell               " No sounds!

    " Search {{
        set showmatch            " Show matching delimiters
        set incsearch            " find as you type
        set hlsearch             " Highlight search terms
        set ignorecase           " case insensitive search
        set smartcase            " case sensitive when uc present
        set gdefault             " global flag for substitute by default
    " }}

    " Behavior {{
        set backspace=indent,eol,start
        set mouse=a
        set lazyredraw           " Don't update screen while running macros
        set hidden               " Hide abandoned buffers
        set nostartofline

        set clipboard+=unnamed
        set scrolloff=10
        set shortmess+=filmnrxoOtTs
    " }}

    " Omnicomplete {{
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

            "au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
        augroup END
    " }}

    " Formatting {{
        set autoindent
        set shiftround
        set expandtab
        set shiftwidth=4
        set tabstop=4
        set softtabstop=4

        " Trigger to preserve indentation on pastes
        set pastetoggle=<localleader>p

        " Wrapping {{
            set nowrap
            " Backspace and cursor keys to wrap
            set whichwrap=b,s,h,l,<,>,[,]
            set textwidth=79
            set colorcolumn=85
            
            " see :h fo-table
            set formatoptions=qrn1l
        " }}
    " }}

    " Folding {{
        set foldenable
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

        " Restore some folding powers!
        au FileType vim set foldmarker={{,}} foldmethod=marker
    " }}

    " Backups, swapfiles, persistence {{
        " No backup (that's what git is for!) and swapfiles are annoying
        set noswapfile
        set nobackup

        " Persistent undo
        set undofile
        set undodir=~/.vim/tmp/undo
        set undolevels=500
        set undoreload=500
        set history=500

        " Buffer state persistence
        set viewdir=~/.vim/tmp/views
        set viewoptions=cursor,folds,unix,slash
        augroup persistence
            au!
            au BufWinLeave * if expand("%") != "" | mkview | endif
            au BufWinEnter * if expand("%") != "" | loadview | endif
        augroup END
    " }}
" }}

" Keymappings {{
    " The rule is simple. Keymappings with leader = apply globally to any filetype.
    " Keymappings with localleader = apply to specific filetypes.

    " Comma get some... sorry.
    let mapleader = ','
    let maplocalleader = '\'
    noremap ; :

    " Easier than escape. Pinnacle of laziness.
    imap jj <ESC>
    " Damn you escape key! How I miss you... literally.
    inoremap <F1> <ESC>
    nnoremap <F1> <ESC>
    vnoremap <F1> <ESC>
    " Turn off highlighting
    noremap <silent> <leader>? :nohlsearch<CR>

    " Navigation {{
        " Normalize all the navigation keys to move by row/col despite and
        " wrapped text
        noremap j gj
        noremap k gk
        
        noremap ∆ 5j
        noremap ˚ 5k

        " Tab alias for matchit
        nmap <Tab> %
        
        " Obey! Get used to hjkl!
        noremap <Left> <Nop>
        noremap <Right> <Nop>
        noremap <Down> <Nop>
        noremap <Up> <Nop>
    " }}

    " Editing {{
        " Fold toggle
        nnoremap <Space> za
        " Make Y act consistant
        nnoremap Y y$
        " Don't leave mode while indenting
        vnoremap < <gv
        vnoremap > >gv
        nmap ≥ >>
        nmap ≤ <<

        " Textmate-like CMD+Enter (O in insert mode)
        inoremap <S-CR> <C-O>o
        inoremap <C-S-CR> <C-O>O
        nnoremap <S-CR> o<Esc>
        nnoremap <C-S-CR> O<Esc>
        vmap . :normal .<CR>

        " Reselect pasted text
        nnoremap <leader>v V`]
        " Easier reformats
        nnoremap <leader>q gqip
        vnoremap <leader>q gq

        " Omnicomplete shortcuts
        imap <expr> <C-Space>   pumvisible() ? "\<C-n>" : "\<C-x><C-n>"
        imap <expr> <S-C-Space> pumvisible() ? "\<C-p>" : "\<C-x><C-p>"
        imap <expr> <A-Space>   pumvisible() ? "\<C-n>" : "\<C-x><C-o>"
        imap <expr> <S-A-Space> pumvisible() ? "\<C-p>" : "\<<C-x><C-o>"
        " A convenient mapping (thanks spf13)
        inoremap <expr> <Esc>   pumvisible() ? "\<C-e>" : "\<Esc>"

        " Add semicolon to end of line
        nnoremap <localleader>; ma$a;<Esc>`a

        " Adjust folding level {{
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
        " Switching between open buffers
        noremap <C-Tab> :bnext<CR>
        noremap <C-S-Tab> :bprev<CR>

        " Jumping between buffers
        nnoremap <C-h> <C-w>h
        nnoremap <C-j> <C-w>j
        nnoremap <C-k> <C-w>k
        nnoremap <C-l> <C-w>l

        nnoremap <C-w>v <C-w>v<C-w>l
        nnoremap <C-w>N :vnew<CR>

        " Shortcuts to vimrc and gvimrc
        nnoremap <leader>ev :e ~/.vimrc<CR>
        nnoremap <leader>eg :e ~/.gvimrc<CR>
    " }}

    " Command {{
        " Annoying command mistakes
        com! W w 
        com! Q q
        com! WQ wq
        " Forget to sudo? (Thanks spf13)
        cmap ww! w !sudo tree % >/dev/null

        " Shortcuts
        cnoremap %% <C-R>=expand('%:h').'/'<CR>
        cnoremap %r <C-R>=expand('%').'/'<CR>
        cnoremap %. <C-R>=expand("%:t")<CR>
        cnoremap !! <C-R>="!".&filetype." "<CR>
        
        " Strip whitespace
        com! -range Trim <line1>,<line2>s/\s\+$//
    " }}
" }}

" Uility {{
    " Functions {{
        func! MlRun()
            let src = expand("%")
            let dst = tempname()
            if src != ""
                silent exe "!".b:ml_bin." ".shellescape(src)." > ".shellescape(dst)
            else
                silent exe "w !".b:ml_bin." > ".shellescape(dst)
            endif

            call MlPreview(dst)
        endfunc

        func! MlRunRange() range
            let dst = tempname()
            let dst_e = shellescape(dst)
            if b:ml_prepend != ""
                let tmp = shellescape(tempname())
                silent exe "!echo ".shellescape(b:ml_prepend)." > ".tmp
                silent exe a:firstline.",".a:lastline."w !cat >> ".tmp
                silent exe "!".b:ml_bin." ".tmp." > ".dst_e

                " tmpfile cleanup
                silent exe "!rm ".tmp
            else
                silent exe a:firstline.",".a:lastline."w !".b:ml_bin." > ".dst_e
            endif

            call MlPreview(dst)
        endfunc

        func! MlSwitch(alt_exts)
            let file_prefix = expand("%:r").'.'
            if len(a:alt_exts) == 0 || a:alt_exts[0] == ""
                if exists("g:ml_last_ft")
                    let a:alt_exts[0] = g:ml_last_ft
                elseif len(a:alt_exts == 0)
                    echom "No source files found or readable to switch to"
                    return
                endif
            endif
            for ft in a:alt_exts
                if filereadable(file_prefix.ft)
                    let file = file_prefix.ft
                    break
                endif
            endfor
            if exists("file")
                let g:ml_last_ft = expand("%:e")
                exe "e ".escape(file)
            else
                echoe "No source files found or readable to switch to."
            endif
        endfunc

        func! MlPreview(tmpfile)
            silent exe ":pedit! ".a:tmpfile
            wincmd P
            setl buftype=nofile noswapfile syntax=none bufhidden=delete
            nnoremap <buffer> <Esc> :pclose<CR>
        endfunc
        
        " Reveal syntax highlighting group under cursor
        func! <SID>SynStack()
            if !exists("*synstack")
                return
            endif
            echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
        endfunc

    " }}

    " Setup {{
        au FileType php,python,ruby,sh 
            \ let b:ml_bin=&filetype | 
            \ let b:ml_prepend="" | 
            \ cnoremap !! !<C-R>=b:ml_bin<CR> |
            \ nnoremap <buffer><silent> <localleader>r :call MlRun()<CR> |
            \ vnoremap <buffer><silent> <localleader>r :call MlRunRange()<CR>
        au FileType php let b:ml_prepend="<?php "
        nmap <C-S-P> :call <SID>SynStack()<CR>
    " }}
" }}

" Plugin Settings {{
    " BufTabs {{
        let g:buftabs_separator = "·"
        let g:buftabs_marker_start = "["
        let g:buftabs_marker_end = "]"
    " }}

    " Colorizer {{
        let g:colorizer_nomap = 1
        nmap <leader>ct <Plug>Colorizer
    " }}

    " CTags {{
        set tags=./.tags;/,~/.tags
        let g:tagbar_phpctags_bin="~/.vim/bin/phpctags/phpctags"
    " }}

    " Ctrip {{
        let g:ctrlp_map = '<leader>t'
        let g:ctrlp_extensions = ['tag', 'buffertag', 'quickfix', 'line', 'changes']

        let g:ctrlp_max_height = 10
        let g:ctrlp_cache_dir = "~/.vim/tmp/ctrip"
        let g:ctrlp_working_path_mode = 0
        let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.hg$\|\.svn|\.settings$',
            \ 'file': '\.exe$\|\.so$\|\.dll|\.sass\-cache|\.classpath|\.project$' }

        nnoremap <silent> <leader>tb :CtrlPBuffer<CR>
        nnoremap <silent> <leader>tt :CtrlPTag<CR>
        nnoremap <silent> <leader>tm :CtrlPMRU<CR>
        nnoremap <silent> <leader>tl :CtrlPLine<CR>
        nnoremap <silent> <leader>tc :CtrlPChangeAll<CR>
        nnoremap <silent> <leader>tc. :CtrlPChange<CR>
    " }}

    " delimitMate {{
        let g:delimitMate_expand_cr = 1
        let g:delimitMate_expand_space = 1
    " }}

    " EasyTags {{
        let g:easytags_cmd = 'ctags'
        let g:easytags_dynamic_files = 1
        let g:easytags_by_filetype = "~/.vim/tmp/tags"
        let g:easytags_updatetime_autodisable = 1
    " }}

    " Eclim {{
        let g:EclimEclipseHome = "/Applications/eclipse"
    " }}

    " Fugitive {{
        nnoremap <silent> <leader>gs :Gstatus<CR>
        nnoremap <silent> <leader>gd :Gdiff<CR>
        nnoremap <silent> <leader>gc :Gcommit<CR>
        nnoremap <silent> <leader>gb :Gblame<CR>
        nnoremap <silent> <leader>gl :Glog<CR>
        nnoremap <silent> <leader>gp :Git push<CR>
    " }}

    " Lusty {{
        nnoremap <leader>B :LustyJuggler<CR>
        nnoremap <leader>. :LustyFilesystemExplorerFromHere<CR>
    " }}

    " NERDCommenter {{
        " Toggle commenting of current line
        map <silent> <leader>/ <leader>c<space>

        let g:NERDShutUp = 1
        let g:NERDCustomDelimiters = {
            \ 'less': { 'left': '//' },
            \ 'scss': { 'left': '//', 'leftAlt': '/*', 'rightAlt': '*/' },
            \ 'html': { 'left': '<!--', 'right': '-->' },
            \ 'htmljinja': { 'left': '{#', 'right': '#}' },
            \ 'twig': { 'left': '{#', 'right': '#}' }
        \ }
    " }}

    " NERDTree {{
        let NERDTreeMinimalUI = 1
        nnoremap <leader>n :NERDTreeToggle<CR>
        nnoremap <leader>N :NERDTreeFind<CR>

        let NERDTreeChDirMode=0
        let NERDTreeIgnore=['\.pyc', '\~$', '\.swo$', '\.swp$', '\.git', '\.hg', '\.svn', '\.bzr', '\.settings', '\.project', '\.DS_Store']
        let NERDTreeKeepTreeInNewTab=0
        let NERDTreeQuitOnOpen=0
        let NERDTreeShowBookmarks=0
        let NERDTreeShowHidden=1
    " }}

    " PIV {{
        " Just my coding preference
        let g:PIVPearStyle = 0
        let g:PHP_autoformatcomment = 0

        " Disable PIV's auto folding (preserves my nice foldtext function)
        let g:DisableAutoPHPFolding = 1
        " DelimitMate handles autoclosing delimiters for us, so disable PIV's
        let g:PIVAutoClose = 0
    " }}

    " Powerline {{
        let g:Powerline_mode_n = 'N'
        let g:Powerline_mode_i = 'I'
        let g:Powerline_mode_v = 'V'
        let g:Powerline_mode_V = 'V-'
        let g:Powerline_mode_cv = 'V+'
        let g:Powerline_mode_R = 'R'
    " }}

    " PythonMode {{
        let g:pymode_run = 0
        let g:pymode_lint_checker = 'pyflakes'
        if !has('python')
            let g:pymode = 1
        endif
    " }}

    " Syntastic {{
        let g:syntastic_auto_loc_list=1
    " }}

    " Tabularize {{
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
    " }}

    " TagBar {{
        nnoremap <silent> <leader>r :TagbarToggle<CR>
    " }}

    " UltiSnips {{
        let g:UltiSnipsSnippetDirectories = ['snippets']
        let g:UltiSnipsJumpForwardTrigger = "<tab>"
        let g:UltiSnipsJumpBackwardTrigger = "<S-tab>"
    " }}

    " Vim-indent-guides {{
        let g:indent_guides_enable_on_vim_startup = 1
        let g:indent_guides_start_level           = 2
        let g:indent_guides_guide_size            = 1
        let g:indent_guides_auto_colors           = 1
        let g:indent_guides_color_change_percent  = 4
    " }}
" }}

" vim: set foldmarker={{,}} foldlevel=0 foldmethod=marker
