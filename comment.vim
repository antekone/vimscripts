fu! Comment()
	let l:extended1 = 0
	if &filetype == "vim"
		let l:comm_char = "\""
	elseif &filetype == "ruby"
		let l:comm_char = "#"
	elseif &filetype == "python"
		let l:comm_char = "#"
	elseif &filetype == "c" || &filetype == "c++" || &filetype == "cpp" || &filetype == "rust" || &filetype == "arduino" || &filetype == "java"
		let l:comm_char = "//"
		let l:extended1 = 1
	elseif &filetype == "vim"
		let l:comm_char = "\""
	elseif &filetype == "javascript" || &filetype == "html"
		let l:comm_char = "//"
		let l:extended1 = 1
	elseif &filetype == "haskell"
		let l:comm_char = "--"
		let l:extended1 = 1
	elseif &filetype == "cmake"
		let l:comm_char = '#'
	elseif &filetype == "clojure"
		let l:comm_char = ';'
	endif

	let l:line = getline('.')
	if l:line[0] == l:comm_char[0]
		if l:extended1 == 1
			let l:line = substitute(l:line, "^..", "", "")
		else
			let l:line = substitute(l:line, "^.", "", "")
		endif
	else
		let l:line = l:comm_char . line
	endif
	call setline('.', l:line)
endfunction
