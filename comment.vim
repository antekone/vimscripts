fu! Comment()
	if &filetype == "vim"
		let l:comm_char = "\""
	elseif &filetype == "ruby"
		let l:comm_char = "#"
	elseif &filetype == "python"
		let l:comm_char = "#"
	elseif &filetype == "c" || &filetype == "c++" || &filetype == "cpp"
		let l:comm_char = "//"
	endif

	let l:line = getline('.')
	if l:line[0] == l:comm_char
		let l:line = substitute(l:line, "^.", "", "")
	else
		let l:line = l:comm_char . line
	endif
	call setline('.', l:line)
endfunction
