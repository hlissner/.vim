so ~/.vim/ftplugin/css.vim

let g:ml_last_csstype = "scss"
let b:ml_scss_bin = "sass --scss --style compressed --no-cache --quiet"

setl comments=b://,s1:/*,mb:*,ex:*/

" Compiles ./*.scss => ./*.css
func! ScssCompile(src, dest)
    let cmd = "w !".g:ml_scss_bin
    let thisfile = a:src
    if strlen(thisfile)
        let cmd .= " ".shellescape(thisfile)." "
    else
        let cmd .= " > "
    endif
    if !strlen(a:dest)
        let a:dest = expand("%:r").".css"
    endif        
    exe cmd." ".shellescape(a:dest)
endfunc

" Compiles all scss files into working directory
func! ScssCompileProject(dest)
    let rootdir = expand("%:p:h")
    if !strlen(rootdir)
        let rootdir = exe "pwd"
    endif
    let scssfiles = glob(rootdir."/*.scss")
    for scssfile in scss_files
        if matchstr(scssfile, "^_") continue endif
        call ScssCompile(scssfile)
        echom "Compiled ".scssfile
    endfor
    echom "Project compiled!"
endfunc

" Compiles the current file then sends it to transmit
func! ScssUpload()
    if !strlen(expand("%"))
        echoe "File not saved!"
        return
    endif
    let cssfile = expand("%:r").'.css'
    if filereadable(cssfile)
        call system("open -a Transmit ".shellescape(cssfile))
        echom "Stylesheet uploaded!"
    else
        echoe "Couldn't find compiled stylesheet!"
    endif
endfunc

" Commands
com! -range=% -nargs=* -complete=file Scss <line1>,<line2>!sass --scss --no-cache <args>
com! -range=% -nargs=? -complete=file ScssCompile call ScssCompile(expand("%"), <q-args>)

" Keymappings
nnoremap <buffer> <localleader>r :ScssCompile<CR>
nnoremap <buffer> <localleader>u :call ScssUpload()<CR>
nnoremap <buffer> <localleader>e :call MlSwitch(["css"])<CR>
