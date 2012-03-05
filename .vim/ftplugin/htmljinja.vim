if exists("loaded_matchit")
    let b:match_ignorecase = 1
    let b:match_skip = 's:Comment'
    let b:match_words = '<:>,' .
    \ '<\@<=[ou]l\>[^>]*\%(>\|$\):<\@<=li\>:<\@<=/[ou]l>,' .
    \ '<\@<=dl\>[^>]*\%(>\|$\):<\@<=d[td]\>:<\@<=/dl>,' .
    \ '<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>,'  .
    \ '{% *if .*%}:{% *else *%}:{% *endif *%},' .
    \ '{% *for .*%}:{% *endfor *%},' .
    \ '{% *with .*%}:{% *endwith *%},' .
    \ '{#:#},' .
    \ '{% *block .*%}:{% *endblock *%},' .
    \ '{% *raw .*%}:{% *raw *%},' .
    \ '{% *spaceless .*%}:{% *endspaceless *%}'
endif
