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

"entry point tomemo#call_tomemo(){{{
function! tomemo#call_tomemo(...)
    let s:context = tomemo#init#init_context(a:000)
    echo s:context["command"]

    if s:context["command"] == ''
        call tomemo#open_local_file(s:context)
    elseif s:context["command"] == "global"
        call tomemo#open_global_file(s:context)
    elseif s:context["command"] == "project"
        call tomemo#open_project_file(s:context)
    elseif s:context["command"] == "test"
        execute "echo 'aaa'"
    endif

    exe "set filetype=tm"
    
endfunction
" }}}

function! tomemo#get_option_com(context) "{{{
    if a:context["option"] == '-v'
        let com = "vsplit "
    elseif a:context["option"] == '-s'
        let com = "split "
    elseif a:context["option"] == '-e'
        let com = "edit "
    else
        let com = "vsplit "
    endif
    return com
endfunction "}}}
    

function! tomemo#init() "{{{
    if !isdirectory(s:tomemo_dir)
        call mkdir(s:tomemo_dir, "p")
    endif
endfunction
"}}}

function! tomemo#open_local_file(context) "{{{
    if !isdirectory(s:tomemo_local_filepath)
        call mkdir(s:tomemo_local_filepath, "p")
    endif
    let com = tomemo#get_option_com(a:context)
    execute com . s:tomemo_local_filepath . s:filename . s:tomemo_ext
endfunction
"}}}

function! tomemo#open_global_file(context) "{{{
    let com = tomemo#get_option_com(a:context)
    execute com . s:tomemo_global_filename . s:tomemo_ext
endfunction
"}}}

function! tomemo#open_project_file(context) "{{{
    if !isdirectory(s:tomemo_project_dir)
        call mkdir(s:tomemo_project_dir)
    endif
    let com = tomemo#get_option_com(a:context)

    execute com . s:tomemo_project_dir . a:context["source"] . s:tomemo_ext
endfunction
"}}}


let &cpo = s:save_cpo
unlet s:save_cpo


" vim:set foldmethod=marker:
