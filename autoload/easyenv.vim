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

function! easyenv#Execute() abort
    let l:path = easyenv#config#Get()
    if filereadable(l:path)
        call easyenv#config#Load(l:path)
    else
        call easyenv#config#Create(l:path)
    endif
endfunction
