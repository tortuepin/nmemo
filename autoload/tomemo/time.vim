function! tomemo#time#print_time(...)
    let tmp = getline(line("."))
    let line = tmp . " [" . strftime("%y%m%d%H%M") . "]"
    call setline(line("."), line)
endfunction
