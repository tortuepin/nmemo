let s:save_cpo = &cpo
set cpo&vim

function! neomemo#call_neomemo()
    execute "vsplit"
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
