let s:save_cpo = &cpo
set cpo&vim


let s:tomemo_local_dir = fnamemodify("~/.tomemo/Local/", ":p:h")
let s:tomemo_global_filename = fnamemodify("~/.tomemo/global/", ":p:h")
let s:filepath = expand("%:p:h")
let s:filename = expand("%:t")
let s:tomemo_local_filepath = s:tomemo_local_dir . s:filepath
let s:tomemo_ext = ".tm"

"entry point
function! tomemo#call_tomemo(...)
    if a:1 == "global"
        call tomemo#open_global_file()
    else
        call tomemo#init()
        call tomemo#open_local_file()
    endif
endfunction


function! tomemo#init()
    if !isdirectory(s:tomemo_local_dir)
        call mkdir(s:tomemo_local_dir, "p")
    endif
endfunction


function! tomemo#open_local_file()
    if !isdirectory(s:tomemo_local_filepath)
        call mkdir(s:tomemo_local_filepath, "p")
    endif
    execute "vsplit " . s:tomemo_local_filepath ."/". s:filename . s:tomemo_ext
endfunction


function! tomemo#open_global_file()
    execute "vsplit " . s:tomemo_global_filename . s:tomemo_ext
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
