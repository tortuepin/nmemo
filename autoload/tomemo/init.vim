function! tomemo#init#init_context(args)
    let context = {
                 \ 'command': exists("a:args[0]") ? a:args[0] : '',
                 \ 'option' : '',
                 \ 'source' : ''
                 \ }

    if exists("a:args[0]") && tomemo#init#check_option(a:args[0])
        let context['option'] = a:args[0]
        let context['command'] = exists("a:args[1]") ? a:args[1] : ''
    endif
    if exists("a:args[1]") && tomemo#init#check_option(a:args[1])
        let context['option'] = a:args[1]
        let context['source'] = exists("a:args[2]") ? a:args[2] : ''
    else
        let context['source'] = exists("a:args[1]") ? a:args[1] : ''
    endif
    return context
endfunction

" judge optioin or not
function! tomemo#init#check_option(str)
    if a:str[0] == '-'
        return v:true
    endif
    return v:false
endfunction


