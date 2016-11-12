if exists('g:loaded_neomemo')
    finish
endif
let g:loaded_neomemo = 1

let s:cpo_save = &cpo
set cpo&vim

command! Neomemo call neomemo#call_neomemo()

let &cpo = s:cpo_save
unlet s:cpo_save
