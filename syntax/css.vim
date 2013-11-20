
if exists("_loaded_syntax_css")
  finish
endif
let _loaded_syntax_css = 1

" Clear a problematic hi group, causing issues with text-* and padding
syn clear cssUIAttr

hi link cssBraces scssDefinition
