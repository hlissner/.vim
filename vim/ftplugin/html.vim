so ~/.vim/bundle/vim-sparkup/ftplugin/html/sparkup.vim

func! HtmlSpecialChars()
ruby << EOF
  @str=VIM::Buffer.current.line
  VIM::Buffer.current.line=@str.unpack("U*").collect {|s| (s > 127 ? "&##{s};" : s.chr) }.join("")
EOF
endfunc

func! StripTags(tag) range
    let l:tag = strlen(a:tag) ? a:tag : '.'
    exe a:firstline.','.a:lastline.'s/<\/\?'.l:tag.'\{-\}>/'
endfunc

com! -range HtmlSpecialChars <line1>,<line2>call HtmlSpecialChars()
com! -range -nargs=? StripTags <line1>,<line2>call StripTags(<q-args>)
