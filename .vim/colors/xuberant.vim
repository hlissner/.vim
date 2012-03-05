" Xuberant colors
"
" Author: Henrik Lissner <henrik@lissner.net>
" Note: Based on Brian Mock's DarkSpectrum

hi clear

set background=dark
if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
    hi clear
    if exists("syntax_on")
        syntax reset
    endif
endif
let g:colors_name="xuberant"

" Syntax Highlighting {{
    hi Normal       guifg=#ffffff guibg=#262626
    hi Comment		guifg=#6b6b6b               gui=italic
    hi Constant		guifg=#ff8b2a
    hi Function		guifg=#bbbbbb
    hi Identifier	guifg=#a7d3fc
    hi Keyword      guifg=#9ae3fb
    hi Number		guifg=#eddb5d
    hi PreProc		guifg=#98f174
    hi Special		guifg=#e9b96e
    hi Statement	guifg=#98f174
    hi String		guifg=#7cadeb guibg=#1a1a1a gui=italic
    hi Todo			guifg=#aaaaaa guibg=#ef5939 gui=bold
    hi Type			guifg=#ffffff               gui=bold
" }}

" General Colors {{
    hi Cursor		guifg=#000000 guibg=#dddddd
    hi CursorLine	              guibg=#1F1F1F

    hi DiffAdd      guifg=#ffcc7f guibg=#a67429 gui=none
    hi DiffChange   guifg=#7fbdff guibg=#425c78 gui=none
    hi DiffDelete   guifg=#000000 guibg=#000000 gui=none
    hi DiffText     guifg=#8ae234 guibg=#4e9a06 gui=none

    "hi Directory	guifg=#729fcf
    hi Folded		guifg=#535353 guibg=#202020 gui=bold
    hi Ignore		guifg=#555753
    hi IncSearch	guifg=#3465a4 guibg=#FFFFFF 
    hi LineNr		guifg=#535353 guibg=#202020
    hi MatchParen	guifg=#FFFFFF guibg=#ad7fa8
    hi ModeMsg		guifg=#fce94f
    hi MoreMsg		guifg=#fce94f

    hi Pmenu        guifg=#c0c0c0 guibg=#000000 
    hi PmenuSbar    guifg=#444444 guibg=#444444 
    hi PmenuSel     guifg=#ffffff guibg=#3465a4 
    hi PmenuThumb   guifg=#888888 guibg=#888888  

    hi Search		guifg=#000000 guibg=#e8da75
    hi SpecialKey	guifg=#8ae234
    hi StatusLine   guifg=#dddddd guibg=#3C3C3C gui=none
    hi StatusLineNC guifg=#808080 guibg=#3C3C3C gui=none

    hi Title		guifg=#ef5939
    hi VertSplit	guifg=#303030 guibg=#303030 gui=none
    hi Visual		guifg=#FFFFFF guibg=#3465a4 gui=none
    hi VisualNOS    guifg=#FFFFFF guibg=#204a87 gui=none
    hi WarningMsg	guifg=#ef5939
    hi WildMenu     guifg=#ffffff guibg=#3465a4 gui=none

    hi Underlined	guifg=#ad7fa8               gui=underline

    hi IndentGuidesOdd    guibg=#2b2b2b
    hi IndentGuidesEven   guibg=#2d2d2d
" }}

" Links {{
    hi! link FoldColumn     Folded
    hi! link NonText        LineNr

    hi link cppSTL          Function
    hi link Error			Todo
    hi link Character		Number
    hi link rubySymbol		Number
    hi link htmlTag			htmlEndTag
    hi link htmlLink		Underlined
    hi link Question		Type
    hi link CursorIM		Cursor
    hi link VisualNOS		Visual
    hi link xmlTag			Identifier
    hi link xmlTagName		Identifier

    hi link StorageClass    PreProc
" }}

" Languages {{

    " PHP {{
        hi link phpFunctions        Function
        hi link phpIdentifier       Identifier
        hi link phpOperator         Normal
        hi link phpVarSelector      Identifier
        hi link phpType             PreProc
        hi link phpMemberSelector   Special
        hi link phpOperator         Special

        " Twig {{
            hi link jinjaBlockName  Identifier
            hi link jinjaTagBlock   Special
            hi link jinjaStatement  Special
        " }}
    " }}

    " Python {{
        hi link pythonFunction	Function
        hi link pythonVariable  Identifier
    " }}

    " Ruby {{
        hi link rubyVariable    Identifier
        hi link rubySharpBang	Special
    " }}

    " Shell {{
        hi link shDeref			Identifier
        hi link shVariable		Function
    " }}

    " VIM {{
        hi link vimOption       Identifier
        hi link vimIsCommand    PreProc
    " }}

" }}

" vim: sw=4 ts=4
