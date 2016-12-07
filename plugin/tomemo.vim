if exists('g:loaded_tomemo')
    finish
endif
let g:loaded_tomemo = 1

let s:cpo_save = &cpo
set cpo&vim
command! -nargs=* Tomemo call tomemo#call_tomemo(<f-args>)
command! -nargs=* Todo call tomemo#switch_todo()

let &cpo = s:cpo_save
unlet s:cpo_save
