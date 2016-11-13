let s:save_cpo = &cpo
set cpo&vim

let s:tomemo_dir = "~/.tomemo"
let s:tomemo_local_dir = fnamemodify(s:tomemo_dir . "/Local", ":p")
let s:tomemo_project_dir = fnamemodify(s:tomemo_dir . "/Project", ":p")
let s:tomemo_global_filename = fnamemodify(s:tomemo_dir . "/global", ":p")
let s:filepath = expand("%:p:h")
let s:filename = expand("%:t")
let s:tomemo_local_filepath = s:tomemo_local_dir . s:filepath
let s:tomemo_ext = ".tm"

"entry point
function! tomemo#call_tomemo(...)
    call tomemo#init()
    if a:1 == "global"
        call tomemo#open_global_file()
    elseif a:1 == "project"
        if exists("a:2")
            call tomemo#open_project_file(a:2)
        endif
    else
        call tomemo#open_local_file()
    endif
endfunction


function! tomemo#init()
    if !isdirectory(s:tomemo_dir)
        call mkdir(s:tomemo_dir, "p")
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

function! tomemo#open_project_file(project_name)
    execute "vsplit " . s:tomemo_project_dir ."/". a:project_name . s:tomemo_ext
endfunction


let &cpo = s:save_cpo
unlet s:save_cpo
