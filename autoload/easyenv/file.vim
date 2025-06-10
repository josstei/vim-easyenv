function! easyenv#file#CheckExists(file)
    if !filereadable(a:file)
        throw 'File already Exists'
    endif
endfunction

function! easyenv#file#Write(file,directory)
    let l:json = easyenv#json#Encode(a:file)
    call writefile(l:json,a:directory)
endfunction

