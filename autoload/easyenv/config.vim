function! easyenv#config#Create() abort
    try
        let l:file = easyenv#config#Get()
        call easyenv#file#CheckExists(l:file)
    catch /*./
        echom 'EasyEnv: ' . v:exception
    endtry
endfunction

" function! easyenv#config#Create() abort
"     let l:dir = easyenv#config#Get()
" 
"     if !filereadable(l:dir)
"         call writefile(split(json_encode(g:easyenv_dotfile_default),'\n'), l:dir)
"         echom g:easyenv_dotfile_config .' file created at '  . l:dir
"     else
"         echom g:easyenv_dotfile_config .' file exists at '  . l:dir
"     endif
" endfunction
" 
function! easyenv#config#Get() abort
    let l:manifest = easyenv#GetManifestFile() 
    return get(l:manifest,'root',getcwd()) . '/' . g:easyenv_dotfile_config
endfunction

" function! easyenv#config#Load() abort
"     let l:file = expand(easyenv#config#Get())
"     if filereadable(l:file)
"         let l:json = join(readfile(l:file), "\n")
"         let l:data = json_decode(l:json)
" 
"         if has_key(l:data, 'environment')
"             let g:easy_env = l:data.environment
"         else
"             echoerr "No 'environment' key found in .easyops.json"
"         endif
"     endif
" endfunction
" 
" function! easyops#command#GetEnv() abort
"     call easyops#config#LoadEasyOpsConfig()
"     let l:env_parts = []
" 
"     if exists('g:easyops_env')
"         for [key, val] in items(g:easyops_env)
"             execute 'let $' . key .' = ' . shellescale(val,1)
"         endfor
"     endif
"     return join(l:env_parts, ' ')
" endfunction
