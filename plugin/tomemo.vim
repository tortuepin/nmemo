if exists('g:loaded_tomemo')
    finish
endif
let g:loaded_tomemo = 1

let s:cpo_save = &cpo
set cpo&vim

command! Tomemo call tomemo#call_tomemo()

let &cpo = s:cpo_save
unlet s:cpo_save
