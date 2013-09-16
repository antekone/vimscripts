fu! FindWScriptDir()
	let l:path_tokens = split(expand('%:p'), '/')
	for ltry in range(len(l:path_tokens) - 2, 0, -1)
		let l:tmp_path = '/'.join(l:path_tokens[0:ltry], '/')
		if filereadable(join([l:tmp_path, 'wscript'], '/'))
			return l:tmp_path
		endif
	endfor
	return -1
endfunction

fu! InsertMocTag()
	let l:lines = line("$")
	let l:idx = 0
	while l:idx < l:lines
		if match(getline(l:idx), "^#ifdef MOC") != -1
			echo "Magic found at line " . l:idx . ", not casting MOC magic."
			return
		endif
		let l:idx += 1
	endwhile

	let l:basedir = FindWScriptDir()
	if l:basedir == -1
		echo "Base dir not found, sorry"
		return
	endif

	let l:mocpath = substitute(expand('%:p')[1 + len(l:basedir):-1], "\\..*", "", "") . ".moc"

	call setline(1 + l:lines, "")
	call setline(2 + l:lines, "#ifdef MOC")
	call setline(3 + l:lines, "#include \"". l:mocpath ."\"")
	call setline(4 + l:lines, "#endif")
endfunction
