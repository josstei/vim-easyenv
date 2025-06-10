function! easyenv#json#Encode(value) abort
    let l:json = json_encode(a:value)
    return split(l:json,'\n')
endfunction

function! easyenv#json#Decode(value) abort
    let l:json = join(a:value, "\n")
    return json_decode(l:json)
endfunction
