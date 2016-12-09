if exists('b:did_ftplugin')
    finish
endif
let b:did_ftplugin = 1

command! -buffer Todo call tomemo#todo#switch_todo()
command! -buffer -nargs=* Time call tomemo#time#print_time(<f-args>)
