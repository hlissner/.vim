""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
Plug 'arnaud-lb/vim-php-namespace'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrc-lang-php
    au FileType php setl nowrap makepkg=php\ -l\ % errorformat=%m\ in\ %f\ on\ line\ %l
    au FileType php let php_folding=1 | let b:PHP_autoformatcomment=0 | let b:match_skip='s:comment\|string'
    au FileType php let b:match_words='<?\(php\)\?:?>,\<switch\>:\<endswitch\>,' .
                \ '\<if\>:\<elseif\>:\<else\>:\<endif\>,' .
                \ '\<while\>:\<endwhile\>,\<do\>:\<while\>,' .
                \ '\<for\>:\<endfor\>,\<foreach\>:\<endforeach\>' .
                \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
                \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
                \ '<\@<=\([^/?][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>,' .
                \ '<:>,(:),{:},[:]'
augroup END

" vim: set ft=vim:
