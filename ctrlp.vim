" CtrlP is a very nice plugin, I really like it.
"
" ... however, it's very slow when used on a virtual machine with windows,
" when using vim over msys2 shell.
"
" it's not a big problem if the project has 10 files, but sometimes the
" project contains thousands of files, spanning over tens of directories.
"
" So, this file tries to use some kind of `ctrlp cache file`.

fu! CtrlPRefreshCacheFile()
    if filereadable(".ctrlp-cache")
        "let g:ctrlp_user_command = '/usr/bin/cat %s/.ctrlp-cache'
        let g:ctrlp_user_command = 'find %s -type f | grep -v \.git'
    endif
endfunction

call CtrlPRefreshCacheFile()
