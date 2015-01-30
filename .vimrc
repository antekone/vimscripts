" Close all folds: zM
" Toggle fold:     za

" Preamble {{{
if has("win32")
	set gfn=Terminus:h9:cEASTEUROPE
	"set gfn=Consolas:h11:cEASTEUROPE
    "set gfn=Fira_Mono:h10:cEASTEUROPE
	set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:block-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
else
	source ~/.vimfont
endif

set modelines=5
set nobomb
set endofline
set nu
set nocompatible
set backspace=indent,eol,start
set tw=80
set ts=4
set sw=4
set ai
set et
set go-=m " hide menu
set go-=t " hide tearoffs
set go-=T " hide toolbar
set go-=a
set go+=c " don't use GUI dialogs
set go-=e " don't show graphical tabs
set ruler
set lazyredraw

if has("win32")
    colors torte
else
    colors slate
endif

" fix slate's CursorLine background color
set hlsearch
set mouse=
set mousehide
set switchbuf=useopen,usetab
set complete=.,w,b,t
set pumheight=15
set showfulltag
set completeopt=longest,menuone
set foldenable
set foldmethod=marker
set foldlevelstart=0
set foldopen=block,insert,jump,mark,percent,quickfix,search,tag,undo
set ttyfast
set linespace=0
set lazyredraw
set title
set nowrap
set linebreak
set virtualedit=all
syntax on
"set list " Display unprintable characters?
" }}}
" Makeprg configuration {{{
map <F9> :make!<CR><CR>
if has("win32")
	set makeprg=gmake
endif
" }}}
" Cursor stuff {{{
nnoremap <up> <C-w>+
nnoremap <S-up> 10<C-w>+
nnoremap <C-up> <C-w>k

nnoremap <down> <C-w>-
nnoremap <S-down> 10<C-w>-
nnoremap <C-down> <C-w>j

nnoremap <left> <C-w><
nnoremap <S-left> 20<C-w><
nnoremap <C-left> <C-w>h

nnoremap <right> <C-w>>
nnoremap <S-right> 20<C-w>>
nnoremap <C-right> <C-w>l

inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
noremap H ^
noremap L $
" }}}
" Leader key {{{
let mapleader = "\\"
nnoremap <leader># :source ~/.vimrc<cr>
nnoremap <leader>. :vsplit ~/.vimrc<cr>
nnoremap <leader>[ :cp<cr>
nnoremap <leader>] :cn<cr>

nnoremap <leader>/  :call Comment()<cr>
vnoremap <leader>/  :call Comment()<cr>
nnoremap <leader><space> :noh<cr>
nnoremap <silent><leader>hh :setl hls<CR>:let @/="\\<<C-r><C-w>\\>"<CR>
inoremap <leader><tab> <esc>l

inoremap <leader>t <esc>:tabnew<cr>li
nnoremap <leader>t :tabnew<cr>
inoremap <leader>a <esc>:tabprev<cr>li
nnoremap <leader>a :tabprev<cr>
inoremap <leader>s <esc>:tabnext<cr>li
nnoremap <leader>s :tabnext<cr>
nnoremap <leader>q :q<cr>
inoremap <leader>/ \
nnoremap <leader>` :A!<cr>
nnoremap <leader>F :FindCursor<cr>

fu! QfToggle()
    for i in tabpagebuflist()
        if getbufvar(i, "&buftype") == "quickfix"
            cclose
            return
        endif
    endfor

    copen
    wincmd p
endfunction

nnoremap <leader>e :call QfToggle()<cr>

" QtCreator's bindings
nnoremap <leader>b :make<cr>
nnoremap <leader>r :run<cr>
nnoremap <leader>d :debug<cr>
" }}}
" Navigation, etc {{{
nnoremap <A-Left> <C-t>
nnoremap <A-Right> <C-]>
nnoremap <F3> <C-]>
nnoremap <space> viwy

vnoremap > >gv
vnoremap < <gv
" }}}
" Clipboard {{{
inoremap <C-v> <esc>"+gpa
vnoremap <C-y> "+y
" }}}
" ESC {{{
inoremap jk <esc>
inoremap <F10> <esc>
inoremap <esc> <nop>
inoremap <C-o> <esc>O
vnoremap <return> <esc>
vnoremap <esc> <nop>
" }}}
" Ctrl+V paste {{{
" Insert yanked text to the command line buffer by Shift+Insert
cnoremap <S-Insert> <C-r>"
" Insert system-yanked text to the command line buffer by Ctrl+V
cnoremap <C-v> <C-r>+
" }}}
" CtrlP {{{
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.o,*.ilk,*.pdb,*.dll,*.so,*/tmp/*
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn|bzr)$',
	\ 'file': '\v\.(exe|so|dll|gch)$',
\ }
" }}}
" Vim-C++ Enhanced Highlight {{{
set runtimepath^=~/.vim/bundle/vim-cpp-enhanced-highlight
" }}}
" Gundo {{{
set runtimepath^=~/.vim/bundle/Gundo
" }}}
" UltiSnips {{{
set runtimepath^=~/.vim/bundle/ultisnips
set runtimepath^=~/.vim
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories=["ultisnips","ultisnips2"]
command! Snippets e ~\.vim\bundle\ultisnips\ultisnips2\all.snippets
command! SnippetsRuby e ~\.vim\bundle\ultisnips\ultisnips2\ruby.snippets
command! SnippetsC e ~\.vim\bundle\ultisnips\ultisnips2\c.snippets
" }}}
" Custom scripts {{{
source ~/.vim/comment.vim
source ~/.vim/guids.vim
source ~/.vim/moc.vim
source ~/.vim/bundle/a.vim
source ~/.vim/find.vim

" Defines the `FindAll` command, that accepts multiple arguments.
command! -nargs=+ FindAll vimgrep <args>                      **/*.cpp **/*.c **/*.m **/*.h
command! FindCursor execute "vimgrep /".expand("<cword>")."/j **/*.cpp **/*.c **/*.h **/*.h"

" }}}
" Cursorline {{{
augroup cursorline
	autocmd!

	"au WinLeave,InsertEnter * set nocursorline
	" Cursorline jest wyłączony, bo nie wygląda zbyt
	" dobrze w konsoli.
	"au WinEnter,InsertLeave * set cursorline

	"au WinLeave,InsertEnter * set nocursorcolumn
	"au WinEnter,InsertLeave * set cursorcolumn

	hi CursorLine guibg=#202020
augroup end
" }}}
" Powerline {{{
set laststatus=2
set encoding=utf-8
let g:Powerline_colorscheme = 'solarized256'
" }}}
" EasyGrep {{{
set gp=grep\ -Hn
" }}}
" QuickFix fix ;)
fu! QfScrollToEnd()
    for i in tabpagebuflist()
        if getbufvar(i, "&buftype") == "quickfix"
            copen
            let l:lines = line("$") " get last line
            call cursor(l:lines, 1) " move the cursor to last line
            wincmd p
            redraw
            break
        endif
    endfor
endfunction


au! QuickFixCmdPost make call QfScrollToEnd()

" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e

autocmd FileType mail set nonu          " Remove line numbering from mails (when composing mail from mutt).
autocmd FileType mail set expandtab     " Don't use tabs in mail messages.
autocmd FileType mail set spell spelllang=pl " Enable polish spellchecker.

" Vundle {{{
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc('~/.vim/vundle')
source ~/.vim/vundle-rc.vim
filetype plugin indent on
" }}}
