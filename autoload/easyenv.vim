if exists('g:easyenv_core_loaded')
    finish
endif

let g:easyenv_core_loaded=1

function! easyenv#GetManifestFile() abort
	for [l:type, l:pattern] in items(g:easyenv_manifest_config)
		let l:manifest = findfile(l:pattern,'.;')
		if !empty(l:manifest)
	        let l:default = ''
	        let l:root    = fnamemodify(l:manifest,':p:h')
			return {'type': l:type , 'root': l:root , 'manifest': l:manifest}
		endif
	endfor
    return {}
endfunction

function! easyenv#Execute(command) abort
    if a:command ==# 'Load'
        call easyenv#config#Load()
    elseif a:command ==# 'Create'
        call easyenv#config#Create()
    endif
endfunction
