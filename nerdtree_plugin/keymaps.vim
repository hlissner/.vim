" Press ! and it will ask what command to run. Equivilent of running: !cmd filepath
call NERDTreeAddKeyMap({'key': "!", 'callback': 'NERDTreeToCMD', 'quickhelpText': '', 'scope': 'Node'})

func! NERDTreeToCMD(node)
    let in = input("Command: !")
    if empty(in)
        return
    endif

    exec "!".in." " . shellescape(a:node.path.str())
endfunc

" Press . over an item in NERDTree to send it to LaunchBar
call NERDTreeAddKeyMap({'key': ".", 'callback': 'NERDTreeToLB', 'quickhelpText': '', 'scope': 'Node'})

func! NERDTreeToLB(node)
    " exec "silent !open -a LaunchBar.app " . shellescape(a:node.path.str())
    exec 'silent !open "x-launchbar:select?file='.a:node.path.str().'"'
endfunc
