" Commands {{{
    " Strip whitespace
    com! Trim %s/\s\+$//

    func! StripTags(tag) range
        let l:tag = strlen(a:tag) ? a:tag : '.'
        exe a:firstline.','.a:lastline.'s/<\/\?'.l:tag.'\{-\}>/'
    endfunc

    com! -range -nargs=? StripTags <line1>,<line2>call StripTags(<q-args>)
" }}}

" Debug {{{
    map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
                \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
                \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
" }}}
