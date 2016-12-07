function! tomemo#todo#switch_todo()
    let s:save_cursor = getcurpos()
    let s:line = getline(".")

    if match(s:line, '^\s*\* TODO\|^\s*\* DONE') < 0
        "先頭に* TODOを書き加える
        execute "normal \<Esc>I* TODO \<Esc>"
        call setpos('.', s:save_cursor)
        execute "normal 7l"
    elseif match(s:line, '^\s*\* TODO') >= 0
        "* TODOをDONEに変える
        execute "normal! \<Esc>^d2f \<Esc>"
        execute "normal \<Esc>I* DONE \<Esc>"
        call setpos('.', s:save_cursor)
    elseif match(s:line, '^\s*\* DONE') >= 0
        "* DONEを消す
        exe "normal! \<Esc>^d2f \<Esc>"
        call setpos('.', s:save_cursor)
        execute "normal 7h"
    endif
endfunction

