" How emacs handles the CWD is different from vim. To minimize the context
" shift, these settings cause vim to behave more like emacs.
"
" In a nutshell this means:
"   1. The CWD will be the directory of the current buffer
"   2. When Neotree or CtrlP is used, they pretend the CWD is the root of the
"      project (usually the nearest parent with a .git folder -- see
"      vim-rooter).

" Plugins
Plug 'airblade/vim-rooter'

" Settings
let g:rooter_manual_only = 1

let NERDTreeChDirMode = 2

" vim:set ft=vim:
