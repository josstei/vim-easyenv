function! easyenv#config#Create(path)
    call writefile(easyenv#json#Encode(g:easyenv_dotfile_default),a:path)
    echo 'EasyEnv: File created'
endfunction

function! easyenv#config#Load(path) abort
    let l:data = easyenv#config#Parse(a:path)
    if has_key(l:data, 'environment')
        call easyenv#config#Set(l:data.environment)
    else
        echoerr "No 'environment' key found in .easyenv.json"
    endif
endfunction

function! easyenv#config#Set(data) abort
    for [key, val] in items(a:data)
        if key =~# '^\w\+$'
            execute 'let $' . key . ' = ' . string(val)
        else
            echoerr 'Invalid environment variable key: ' . key
        endif
    endfor
endfunction

function! easyenv#config#Get()
    let l:manifest = easyenv#GetManifestFile() 
    return get(l:manifest,'root',getcwd()) . '/' . g:easyenv_dotfile_config
endfunction

function! easyenv#config#Parse(path)
    let l:file = readfile(a:path)
    return easyenv#json#Decode(l:file)
endfunction
