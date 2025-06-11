if !exists('g:easyenv_dotfile_envvars')
    let g:easyenv_dotfile_envvars = []
endif

function! easyenv#config#Create()
    let l:path = easyenv#config#Path()
    if filereadable(l:path)
        echoerr 'EasyEnv: File Already Exists'
        return
    endif

    call writefile(easyenv#json#Encode(g:easyenv_dotfile_default),l:path)
    echom 'EasyEnv: File created'
endfunction

function! easyenv#config#Load() abort
    let l:path = easyenv#config#Path()

    if !filereadable(l:path)
        echoerr 'EasyEnv: File Missing'
        return
    endif

    let l:data = easyenv#config#Parse(l:path)

    if !has_key(l:data, 'environment')
        echoerr "No 'environment' key found in .easyenv.json"
        return
    endif 

    call easyenv#config#Unset()
    call easyenv#config#Set(l:data.environment)
endfunction

function! easyenv#config#Path()
    let l:manifest = easyenv#GetManifestFile()
    return get(l:manifest,'root',getcwd()) . '/' . g:easyenv_dotfile_config
endfunction

function! easyenv#config#Parse(path)
    let l:file = readfile(a:path)
    return easyenv#json#Decode(l:file)
endfunction

function! easyenv#config#Set(data) abort
    let g:easyenv_dotfile_envvars = []
    for [key, val] in items(a:data)
        if key =~# '^\w\+$'
            execute 'let $' . key . ' = ' . string(val)
            call add(g:easyenv_dotfile_envvars, key)
        else
            echoerr 'Invalid environment variable key: ' . string(key)
        endif
    endfor
endfunction

function! easyenv#config#Unset() abort
    if exists('g:easyenv_dotfile_envvars')
        for key in g:easyenv_dotfile_envvars
            execute 'let $' . key . ' = ""'
        endfor
        let g:easyenv_dotfile_envvars = []
    endif
endfunction
