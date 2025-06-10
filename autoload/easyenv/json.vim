function! easyenv#json#Encode(file) abort
    let l:json = json_encode(a:file)
    return split(l:json,'\n')
endfunction
