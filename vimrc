"              _       _           
"             | |     (_)          
"    _ __ ___ | |_   ___ _ __ ___  
"   | '_ ` _ \| \ \ / / | '_ ` _ \ 
"   | | | | | | |\ V /| | | | | | |
"   |_| |_| |_|_| \_/ |_|_| |_| |_|
"
"   Author: Henrik Lissner
"   Url: http://github.com/hlissner/mlvim
"
"   Mlvim is a distribution of resources and settings I put together for all
"   the dabbling I do in web, game, mobile and app development (the politically
"   correct term would be 'masochist').
" 
"   Only thing it won't do is drive you to work... Yet.
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
scriptencoding utf-8
au!

" Plugins {
    filetype off

    set runtimepath+=~/.vim/bundle/vundle
    call vundle#rc()
    Bundle 'gmarik/vundle'

    " Bundles and their settings are specified externally.
    if filereadable($HOME."/.vimrc.bundles")
        source $HOME/.vimrc.bundles
    endif

    " A local bundles config separate from this distro.
    if filereadable($HOME."/.vimrc.bundles.local")
        source $HOME/.vimrc.bundles.local
    endif

    filetype plugin indent on
" }

" Preferences {
    " set t_Co=256

    syntax on
    set background=dark
    colorscheme molokai

    set cursorline               " Highlight current line
    set laststatus=2             " Show statusbar
    set nolist                   " Don't show whitespace chars (indent-guides does it nicer)
    set nospell                  " No spell check, please
    set number                   " Line numbers
    set visualbell               " No sounds!
    set showmode                 " Show mode in cmdline
    set showmatch                " Show matching delimiters
    set browsedir=buffer         " Sets File>Open to start in current file's path

    if has('cmdline_info')
        set ruler                " Show line/col no in statusline
        set showcmd              " Show command issued
    endif

    " Status line {
        fu! SetActiveStatusLine()
            setl statusline=%1*\ 
            setl statusline+=%t             " tail of the filename
            setl statusline+=\ %*\ 
            setl statusline+=%h%m%r         " flags (help/modified/read-only)
            setl statusline+=%=             " left/right separator
            setl statusline+=%Y             " filetype
            setl statusline+=\ %1*\|%*\ 
            setl statusline+=%c,%l          " cursor column/line number
            setl statusline+=/%L            " total lines
            setl statusline+=\ :\ %P\          " percent through file
        endf

        fu! SetInactiveStatusLine()
            setl statusline=\ %t
            setl statusline+=%h      " help file flag
            setl statusline+=%m      " modified flag
            setl statusline+=%r      " read only flag
        endf

        hi User1 ctermfg=bg ctermbg=grey guifg=white guibg=bg gui=bold

        augroup vim_statusline
            au!
            " Switch active/inactive statusline
            au BufEnter,WinEnter * call SetActiveStatusLine()
            au WinLeave * call SetInactiveStatusLine()
        augroup END
    " }

    " Search {
        set incsearch            " find as you type
        set hlsearch             " Highlight search terms
        set ignorecase           " case insensitive search
        set smartcase            " case sensitive when uc present
        set gdefault             " global flag for substitute by default
    " }

    " Behavior {
        set backspace=indent,eol,start
        set mouse=a
        set lazyredraw           " Don't update screen while running macros
        set hidden               " Hide abandoned buffers
        set nostartofline
        set scrolloff=5
        set shortmess+=filmnrxoOtTs

        " Share a clipboard with OS and vim terminal sessions
        set clipboard=unnamed
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
            " au FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
            au FileType python setl omnifunc=pythoncomplete#Complete
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

        " Trigger to preserve indentation on pastes
        set pastetoggle=<localleader>p

        " Wrapping {
            set nowrap
            " Backspace and cursor keys to wrap
            set whichwrap=b,s,h,l,<,>,[,]
            set textwidth=79
            " set colorcolumn=85
            
            " see :h fo-table
            set formatoptions=qrn1lr
        " }
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

            let foldedLines = "( ".nl." ) "
            let symbol = " ... "

            let indent = repeat(' ', indent(v:foldstart))
            let endcol = &colorcolumn ? &colorcolumn : &textwidth
            let startcol = &columns < endcol ? &columns-4 : endcol
            let outdent = repeat(' ', startcol - strlen(line . foldedLines . symbol))

            return indent . substitute(line,"^ *","",1) . symbol . outdent . foldedLines
        endf
    " }

    " Backups, swapfiles, persistence {
        " No backup (that's what git is for!) and swapfiles are annoying
        set nobackup
        set noswapfile

        if has('persistent_undo')
            set undodir=~/.vim/tmp/undo

            set undofile
            set undolevels=500
            set undoreload=500
        endif
        set history=1000

        " Preserve buffer state (cursor location, folds, etc.)
        set viewdir=~/.vim/tmp/views
        set viewoptions=cursor,folds,unix,slash
        augroup persistence
            au!
            au BufWinLeave * if expand("%") != "" | silent! mkview | endif
            au BufWinEnter * if expand("%") != "" | silent! loadview | endif
        augroup END
    " }
" }

" Keymaps {
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

        " Easier scrolling
        noremap <C-h> zH
        noremap <C-j> 5j
        noremap <C-k> 5k
        noremap <C-l> zL

        " Get used to hjkl!
        noremap <Left> <Nop>
        noremap <Right> <Nop>
        noremap <Down> <Nop>
        noremap <Up> <Nop>

        " Tab alias for matchit
        map <Tab> %
    " }

    " Editing {
        " Fold toggle
        nnoremap <Space> za

        " Make Y act consistant with C and D. It must be in this form to
        " override YankRing's remapping of Y.
        " nnoremap Y y
        function! YRRunAfterMaps()
            nnoremap Y :<C-U>YRYankCount 'y$'<CR>
        endfunction

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

        " Uses A-Space for generic omnicomplete
        imap <expr> <A-Space>   pumvisible() ? "\<C-n>" : "\<C-x><C-n>"
        imap <expr> <S-A-Space> pumvisible() ? "\<C-p>" : "\<C-x><C-p>"

        " Adjust folding level <https://github.com/spf13/spf13-vim>
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
        " New buffer in a v-split
        nnoremap <C-w>N :vnew<CR>

        " Shortcut to vimrc and gvimrc
        nnoremap <leader>ev :e ~/.vimrc<CR>
        nnoremap <leader>el :e ~/.vimrc.local<CR>
        nnoremap <leader>eb :e ~/.vimrc.bundles<CR>
        nnoremap <leader>eg :e ~/.gvimrc<CR>

        " Temporary session management
        let SESSDIR = "~/.vim/tmp/session.vim"
        nnoremap <leader>ss :w<CR>:mksession! <C-R>=SESSDIR<CR><CR>
        nnoremap <leader>sl :so <C-R>=SESSDIR<CR><CR>
        nnoremap <leader>sd :!rm <C-R>=SESSDIR<CR><CR>
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
        cnoremap %% <C-R>=expand('%:p:h').'/'<CR>
        cnoremap %r <C-R>=expand('%')<CR>
        cnoremap %. <C-R>=expand("%:t")<CR>
        
        " Strip whitespace
        com! -range Trim <line1>,<line2>s/\s\+$//
    " }
    
    " Plugins {
        " bufkill {
            " Reopen last closed buffer
            nnoremap <silent> <leader>bz :BUNDO<CR>
        " }

        " Ctrlp {
            let g:ctrlp_map = '<leader>.'
            nnoremap <silent> <leader>, :CtrlPBuffer<CR>
            nnoremap <silent> <leader>ot :CtrlPBufTag<CR>
            nnoremap <silent> <leader>oT :CtrlPBufTagAll<CR>
            nnoremap <silent> <leader>om :CtrlPMRU<CR>
            nnoremap <silent> <leader>oc :CtrlPChange<CR>
            nnoremap <silent> <leader>oC :CtrlPChangeAll<CR>
            nnoremap <silent> <leader>oL :CtrlPChangeAll<CR>
        " }

        " NERDTree {
            nnoremap <leader>n :NERDTreeToggle<CR>
            nnoremap <leader>N :NERDTreeFind<CR>
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
            nnoremap <silent> <leader>tb :TagbarToggle<CR>
        " }

        " TComment {
            map <silent> <leader>/ gcc
            vmap <silent> <leader>/ gc
        " }

        " UltiSnips {
            let g:UltiSnipsExpandTrigger = "<C-CR>"
            let g:UltiSnipsJumpForwardTrigger = "<C-j>"
            let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
        " }
        
        " YankRing {
            nnoremap <leader>yp :YRShow<CR>
            nnoremap <leader>y/ :YRSearch<CR>
        " }

        " YouCompleteMe {
            " Remove <Tab> so that UltiSnips can use it (use C-j/k)
            let g:ycm_key_list_select_completion = ['<Down>', '<Tab>']
            let g:ycm_key_list_previous_completion = ['<Up>', '<S-Tab>']
        " }
    " }
" }

" A local rc file separate from this distro.
if filereadable($HOME."/.vimrc.local")
    source $HOME/.vimrc.local
endif

" vim:set fmr={,} fdl=0 fdm=marker:
