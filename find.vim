fu! GrepUtils(...)
	let l:curtok = a:0 == 0 ? expand("<cword>") : a:1

	if &filetype == "vim"
		let l:files = ["**/*.vim"]
	elseif &filetype == "c"
		let l:files = ["**/*.c", "**/*.h"]
	elseif &filetype == "cpp"
		let l:files = ["**/*.cpp", "**/*.cxx", "**/*.cc", "**/*.h", "**/*.hpp"]
	else
		echo "Can't figure out the format of current file!"
	end

	let l:str = ''
	for i in l:files
		let l:str = l:str . i . " "
	endfor

	let l:curtok = substitute(l:curtok, "\"", "\\\\\"", 'g')
	let l:curtok = substitute(l:curtok, "\\", "\\\\", 'g')

	execute('vimgrep "'.l:curtok.'" **/*.vim')
endfunction
