let s:save_cpo = &cpo
set cpo&vim

function! neomemo#call_neomemo()
    execute "vsplit"
endfunction


set cpo = s:save_cpo
unlet s:save_spo
