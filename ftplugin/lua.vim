set makeprg=for\ depth\ in\ {0..5};\ do\ if\ [\ -f\ main.lua\ ];\ then\ love\ .;\ fi;\ cd\ ..;\ done;\ echo "";

let b:run_live_command = 'lua'
