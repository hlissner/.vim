call NERDTreeAddKeyMap({'key': ".", 'callback': 'NERDTreeToLB', 'quickhelpText': '', 'scope': 'Node'})
call NERDTreeAddKeyMap({'key': "!", 'callback': 'NERDTreeToCMD', 'quickhelpText': '', 'scope': 'Node'})

func! NERDTreeToCMD(node)
    let in = input("Command: !")
    if empty(in)
        return
    endif

    exec "!".in." " . a:node.displayString()
endfunc

func! NERDTreeToLB(node)
    exec "silent !open -a LaunchBar.app " . a:node.displayString()
endfunc
