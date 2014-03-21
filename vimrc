
set nocompatible

let g:is_ssh = ($SSH_TTY != "")

" Check to see if neobundle is installed, install it if not. Init
" plugins and what not afterwards.
source $HOME/.vim/rc/init

" Bundles and their settings are specified externally.
source $HOME/.vim/rc/plugins

" Preferences {{{
    syntax on

    set t_Co=256
    set background=dark
    colorscheme Tomorrow-Night-Eighties

    set autoread                 " Auto-update a file that's been edited externally
    set number                   " Line numbers
    set laststatus=2             " Show statusbar
    set nolist                   " Don't show whitespace chars (indentLine does it nicer)
    set nospell                  " No spell check, please
    set visualbell               " No sounds!
    set browsedir=buffer         " Sets File>Open to start in current file's path
    " set noshowmode               " Don't show mode in cmdline (no need with airline)
    set backspace=indent,eol,start
    set lazyredraw               " Don't update screen while running macros
    set hidden                   " Hide abandoned buffers
    set nostartofline
    set shortmess+=filmnrxoOtTs
    set scrolloff=8

    set mouse=a
    if exists('$TMUX')  " Support resizing in tmux
        set ttymouse=xterm2
    endif

    if has('cmdline_info')
        set ruler                " Show line/col no in statusline
        set showcmd              " Show command issued
    endif

    set textwidth=88
    set fillchars=vert:¦

    " StatusBar
    if has('statusline')
        set laststatus=2

        set statusline=%t                              " tail of the filename
        set statusline+=%w%h%m%r                       " Options
        if g:loaded_syntastic_plugin
            set statusline+=\ %{SyntasticStatuslineFlag()}
        endif
        set statusline+=%=                             " left/right separator
        set statusline+=%y                             " filetype
        if g:loaded_fugitive
            set statusline+=\ %{fugitive#statusline()}     " Git Hotness
        endif
        set statusline+=\ •\ 
        set statusline+=%c                             " cursor column
        set statusline+=\ %l/%L                        " cursor line/total lines
        set statusline+=\ \:%P                         " percent through file
    endif

    " Search 
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
    
    " Omnicomplete 
    set tags=./.tags;/,~/.tags,~/tags

    set completeopt=menu
    set wildmenu                    " Show menu instead of auto-complete
    set wildmode=list:longest,full  " command <Tab> completion: list
                                    " matches -> longest common -> then
                                    " all.
    set wildignore+=*.swp,*.log,.sass-cache,.codekit-cache,config.codekit
    set wildignore+=*.class,*.o,*.pyc,*.obj,*DS_Store*

    " Automatically close the popup menu / preview window
    au InsertLeave * if pumvisible() == 0|silent! pclose|endif
    
    " Formatting 
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
    
    " Folding 
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
    
    au BufRead,BufNewFile *.scss set filetype=scss
    " For some reason vaxe's ftdetect isn't always on the ball
    au BufRead,BufNewFile *.hx set filetype=haxe
" }}}

" rcfiles
source $HOME/.vim/rc/backup
source $HOME/.vim/rc/keymaps
source $HOME/.vim/rc/util

" If one exists, this is where you'll want local settings
try 
    source $HOME/.vimrc.local
catch 
endtry

" vim:set fdl=0 fdm=marker:
