
set nocompatible

let g:is_ssh = ($SSH_TTY != "")

" Initialize NeoBundle
set rtp+=~/.vim/bundle/neobundle.vim/
call neobundle#rc(expand('~/.vim/bundle'))
NeoBundleFetch 'Shougo/neobundle.vim'

" Bundles and their settings are specified externally.
source $HOME/.vim/rc/plugins

" Preferences {{{
    syntax on

    " Editor looks {{{
        " Disable matchit, I find it distracting
        let loaded_matchparen = 1

        if &t_Co == 8 && $TERM !~# '^linux'
            set t_Co=16
        else
            set t_Co=256
        endif
        set background=dark
        colorscheme Tomorrow-Night-Eighties
    " }}}

    set number                   " Line numbers
    set ruler                    " Show line/col no in statusline
    set showcmd                  " Show command issued
    set textwidth=88
    set fillchars=vert:¦
    set list
    set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+

    set autoread                 " Auto-update a file that's been edited externally
    set laststatus=2             " Show statusbar
    set nospell                  " No spell check, please
    set visualbell               " No sounds!
    set backspace=indent,eol,start
    set lazyredraw               " Don't update screen while running macros
    set hidden                   " Hide abandoned buffers
    set nostartofline
    set shortmess+=filmnrxoOtTs
    set scrolloff=8
    set sidescrolloff=5
    set nrformats-=octal
    set fileformats+=mac

    set mouse=a
    if exists('$TMUX')  " Support resizing in tmux
        set ttymouse=xterm2
    endif

    " Netrw settings
    let g:netrw_browse_split = 4
    let g:netrw_altv = 1
    let g:netrw_liststyle=3
    let g:netrw_banner = 0
    let g:netrw_winsize = 20
    au VimLeave * if filereadable("[path here]/.netrwhist")|call delete("[path here]/.netrwhist")|endif

    " Toggle Vexplore with Ctrl-E
    function! ToggleVExplorer()
        if exists("t:expl_buf_num")
            let expl_win_num = bufwinnr(t:expl_buf_num)
            if expl_win_num != -1
                let cur_win_nr = winnr()
                exec expl_win_num . 'wincmd w'
                close
                exec cur_win_nr . 'wincmd w'
                unlet t:expl_buf_num
            else
                unlet t:expl_buf_num
            endif
        else
            exec '1wincmd w'
            Vexplore
            let t:expl_buf_num = bufnr("%")
        endif
    endfunction

    " StatusBar {{{
        if has('statusline')
            set laststatus=2
            set statusline=%t                              " tail of the filename
            set statusline+=%w%h%m%r                       " Options
            if exists('g:loaded_syntastic_plugin')
                set statusline+=\ %{SyntasticStatuslineFlag()}
            endif
            set statusline+=%=                             " left/right separator
            set statusline+=%y                             " filetype
            if exists('g:loaded_fugitive')
                set statusline+=\ %{fugitive#statusline()}     " Git Hotness
            endif
            set statusline+=\ •\ 
            set statusline+=%c                             " cursor column
            set statusline+=\ %l/%L                        " cursor line/total lines
            set statusline+=\ \:%P                         " percent through file
        endif
    " }}}

    " Search {{{
        set incsearch            " find as you type
        set hlsearch             " Highlight search terms
        set ignorecase           " case insensitive search
        set smartcase            " case sensitive when uc present
        set gdefault             " global flag for substitute by default

        if executable('ag')
            let g:ackprg = 'ag --nogroup --nocolor --column'
            set grepprg=ag\ --nogroup\ --nocolor
        elseif executable('ack-grep')
            let g:ackprg = "ack-grep -H --nocolor --nogroup --column"
        endif
    " }}}

    " Formatting {{{
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
    " }}}

    " Folding {{{
    set foldlevel=1
    " Cleaner, readable fold headers
    set foldtext=MyFoldText()
    fu! MyFoldText()
        let line = getline(v:foldstart)
        " Lines that have been folded
        let nl = v:foldend - v:foldstart + 1

        let indent = repeat(' ', indent(v:foldstart))
        let endcol = &colorcolumn ? &colorcolumn : &textwidth
        let startcol = &columns < endcol ? &columns-4 : endcol

        return indent . substitute(line,"^ *","",1)
    endf
    " }}}

    " Backup {{{
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
        set history=5000

        " Preserve buffer state (cursor location, folds, etc.)
        set viewdir=~/.vim/tmp/views
        set viewoptions=cursor,folds,unix,slash
        augroup persistence
            au!
            au BufWinLeave * if expand("%") != "" | silent! mkview | endif
            au BufWinEnter * if expand("%") != "" | silent! loadview | endif
        augroup END
    " }}}

    " Omnicomplete + wild settings {{{
        set tags=./.tags;/,~/.tags,~/tags

        set complete-=i
        set completeopt=menu
        set wildmenu                    " Show menu instead of auto-complete
        set wildmode=list:longest,full  " command <Tab> completion: list
                                        " matches -> longest common -> then
                                        " all.
        set wildignore+=*.swp,*.log,.sass-cache,.codekit-cache,config.codekit
        set wildignore+=*.class,*.o,*.pyc,*.obj,*DS_Store*
    " }}}

    " Automatically close the popup menu / preview window
    au InsertLeave * if pumvisible() == 0|silent! pclose|endif

    " Set *.scss to ft=scss instead of css.scss
    au BufRead,BufNewFile *.scss set filetype=scss
    " For some reason vaxe's ftdetect isn't always on the ball
    au BufRead,BufNewFile *.hx set filetype=haxe
" }}}

" rcfiles
source $HOME/.vim/rc/keymaps
source $HOME/.vim/rc/util

" If one exists, this is where you'll want local settings
try 
    source $HOME/.vimrc.local
catch 
endtry

" vim:set fdl=0 fdm=marker:
