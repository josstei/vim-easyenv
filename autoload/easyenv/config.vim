function! easyenv#config#Create()
    let l:path = easyenv#config#Path()
    if filereadable(l:path)
        echoerr 'EasyEnv: File Already Exists'
        return
    endif

    call writefile(easyenv#json#Encode(g:easyenv_dotfile_default),l:path)
    echo 'EasyEnv: File created'
endfunction

function! easyenv#config#Load() abort
    let l:path = easyenv#config#Path()

    if !filereadable(l:path)
        echo 'EasyEnv: File Missing'
    endif

    let l:data = easyenv#config#Parse(l:path)

    if !has_key(l:data, 'environment')
        echoerr "No 'environment' key found in .easyenv.json"
    endif 

    call easyenv#config#Set(l:data.environment)
    echo 'EasyEnv: File Loaded'
endfunction

function! easyenv#config#Set(data) abort
    for [key, val] in items(a:data)
        if key =~# '^\w\+$'
            execute 'let $' . key . ' = ' . string(val)
        else
            echoerr 'Invalid environment variable key: ' . string(key)
        endif
    endfor
endfunction

function! easyenv#config#Unset() abort

endfunction

function! easyenv#config#Path()
    let l:manifest = easyenv#GetManifestFile() 
    return get(l:manifest,'root',getcwd()) . '/' . g:easyenv_dotfile_config
endfunction

function! easyenv#config#Parse(path)
    let l:file = readfile(a:path)
    return easyenv#json#Decode(l:file)
endfunction
