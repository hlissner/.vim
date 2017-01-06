if has('nvim')
    Plug 'benekastah/neomake'
    autocmd! BufWritePost * Neomake
else
    " Syntax checkers for a multitude of languages
    Plug 'scrooloose/syntastic'
        let g:syntastic_auto_loc_list=0
        " let g:syntastic_quiet_messages={'level': 'warnings'}
        let g:syntastic_phpcs_disable=1
        let g:syntastic_echo_current_error=1
        let g:syntastic_enable_balloons = 0

        let g:syntastic_error_symbol = '►'
        let g:syntastic_warning_symbol = '►'

        let g:syntastic_loc_list_height = 5
        let g:syntastic_mode_map = {'mode': 'active', 'active_filetypes': [], 'passive_filetypes': ['html']}
endif

" vim:set ft=vim:
