fu! DefineGuid()
	let l:curline = getline('.')
	let l:guidre = '{\([a-fA-F0-9]*\)-\([a-fA-F0-9]*\)-\([a-fA-F0-9]*\)-\([a-fA-f0-9]\{2\}\)\([a-fA-F0-9]\{2\}\)-\([a-fA-F0-9]*\)}'
	if match(l:curline, l:guidre) != -1
		let l:lastpart = substitute(l:curline, l:guidre, "\\6", "")
		let l:guidre2 = '\([a-fA-F0-9]\{2\}\)\([a-fA-F0-9]\{2\}\)\([a-fA-F0-9]\{2\}\)\([a-fA-F0-9]\{2\}\)\([a-fA-F0-9]\{2\}\)\([a-fA-F0-9]\{2\}\)'
		if match(l:lastpart, l:guidre2) == -1
			echo "match NOT ok #2"
			return
		endif
		let l:buf = substitute(l:lastpart, l:guidre2, "0x\\1, 0x\\2, 0x\\3, 0x\\4, 0x\\5, 0x\\6", "")
		let l:result = substitute(l:curline, l:guidre, "DEFINE_GUID(g_GuidName, 0x\\1, 0x\\2, 0x\\3, 0x\\4, 0x\\5,".l:buf."); // \\0", "")
		call setline('.', l:result)
	else
		echo "match NOT ok"
	endif
endfunction

