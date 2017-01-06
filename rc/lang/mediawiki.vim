func! Init_mediawiki()
    inoremap <buffer> <silent> = <C-R>=(getline('.')==''\|\|getline('.')=~'^=\+$')?"==\<Lt>Left>":"="<CR>
    setl wrap linebreak fo-=tc fo+=l

    " Make navigation more amenable to the long wrapping lines.
    setl comments=n:#,n:*,n:\:,s:{\|,m:\|,ex:\|}

    " Enable folding based on ==sections==
    setl foldexpr=getline(v:lnum)=~'^\\(=\\+\\)[^=]\\+\\1\\(\\s*<!--.*-->\\)\\=\\s*$'?\">\".(len(matchstr(getline(v:lnum),'^=\\+'))-1):\"=\"
    setl fdm=expr

    if exists("loaded_matchit")
        let b:match_ignorecase=0
        let b:match_skip = 's:Comment'
        let b:match_words = '<:>,' .
        \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
        \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
        \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
    endif
endfunc

au FileType mediawiki Init_mediawiki()
