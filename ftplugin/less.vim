so ~/.vim/ftplugin/css.vim

" Compiles ./*.less => ./*.css
func! LessCompile()
    if strlen(expand("%"))
        w
        exe '!lessc '.shellescape(expand("%")).' > '.shellescape(expand("%:r")).'.css<CR><space>'
    else
        echo "Need to save!"
    endif
endfunc

" Compiles the current file then sends it to transmit
func! LessUpload()
    if strlen(expand("%"))
        let css_file = shellescape(expand("%:r") . ".css")
        if filereadable(css_file)
            exe "!open -a Transmit " . css_file
        else
            call LessCompile()
        endif
        echo "Stylesheet uploaded (" . css_file . ")"
    else
        echo "Need to save!"
    endif
endfunc

" Keymappings
nnoremap <buffer> <localleader>r :call LessCompile()<CR>
nnoremap <buffer> <localleader>u :call LessUpload()<CR>
nnoremap <buffer> <localleader>e :call MlSwitch(["css"])
