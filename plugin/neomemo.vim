if exists('g:loaded_neomemo')
    finish
endif
let g:loaded_neomemo = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=0 Neomemo call neomemo#call_neomemo()

set cpo = s:save_cpo
unlet s:seve_cpo
