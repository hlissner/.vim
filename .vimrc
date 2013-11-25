"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                                                             "
"   Author: Henrik Lissner                                                    "
"   Url: http://github.com/hlissner/vim                                       "
"                                                                             "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
scriptencoding utf-8
au!

" Plugins {{{
    " Check to see if neobundle is installed, install it if not
    source $HOME/.vim/rc/init
    " Bundles and their settings are specified externally.
    source $HOME/.vim/rc/plugins
    " A local bundles config separate from this distro.
    try 
        source $HOME/.vimrc.bundles.local
    catch
    endtry

    filetype plugin indent on
" }}}

" Preferences {{{
    syntax on
    set background=dark
    colorscheme molonew
    let g:airline_theme = "badwolf"

    set laststatus=2             " Show statusbar
    set nolist                   " Don't show whitespace chars (indentLine does it nicer)
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
    set ttyfast

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
    set fillchars=vert:¦

    " Shell {{{
        " 256bit terminals
        set t_Co=256
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
    " Omnicomplete {{{
        set tags=./.tags;/,~/.tags,~/tags

        set completeopt=longest,menu,preview
        set wildmenu                    " Show menu instead of auto-complete
        set wildmode=list:longest,full  " command <Tab> completion: list
                                        " matches -> longest common -> then
                                        " all.
        set wildignore+=*.cache,cache/**,*~,*.swp,*.log,.sass-cache
        set wildignore+=*.class,*.o,*.obj,*DS_Store*

        augroup Omnicomplete
            au!
            " Enable omni completion.
            au FileType css,scss,less setl omnifunc=csscomplete#CompleteCSS
            au FileType html,markdown,htmljinja,xml setl omnifunc=htmlcomplete#CompleteTags
            " au FileType javascript setl omnifunc=javascriptcomplete#CompleteJS
            au FileType xml setl omnifunc=xmlcomplete#CompleteTags
        augroup END

        " Automatically close the popup menu / preview window
        au InsertLeave * if pumvisible() == 0|silent! pclose|endif
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
        " set foldenable
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
" }}}

" rcfiles
source $HOME/.vim/rc/backup
source $HOME/.vim/rc/keymaps
source $HOME/.vim/rc/util

" A local rc file separate from this distro.
try 
    source $HOME/.vimrc.local 
catch 
endtry

" vim:set fdl=0:
