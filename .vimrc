if has("win32")
set gfn=Terminus:h9:cEASTEUROPE
else
set gfn=Liberation\ Mono\ 9
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
set go-=m " hide menu
set go-=t " hide tearoffs
set go-=T " hide toolbar
set go-=a
set go+=c " don't use GUI dialogs
set go-=e " don't show graphical tabs
set ruler
colors slate
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
"set list

map <F9> :make<CR><CR>
set makeprg=gmake

let mapleader = "\\"
nnoremap <leader># :source ~/.vimrc<cr>
nnoremap <leader>. :vsplit ~/.vimrc<cr>
nnoremap <leader>[ :cp<cr>
nnoremap <leader>] :cn<cr>

" Cursor stuff {{{
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
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
noremap L g_
" }}}

" Leader key {{{
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

inoremap jk <esc>
inoremap <F10> <esc>
inoremap <esc> <nop>
inoremap <C-o> <esc>O

nnoremap <leader>` :A!<cr>

" Insert yanked text to the command line buffer by Shift+Insert
cnoremap <S-Insert> <C-r>"
" Insert system-yanked text to the command line buffer by Ctrl+V
cnoremap <C-v> <C-r>+

vnoremap <return> <esc>
vnoremap <esc> <nop>

" CtrlP configuration
set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/vim-cpp-enhanced-highlight
set runtimepath^=~/.vim/bundle/Gundo
set runtimepath^=~/.vim/bundle/vim-fugitive

set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*.o,*.ilk,*.pdb,*.dll,*.so,*/tmp/*
let g:ctrlp_custom_ignore = {
	\ 'dir':  '\v[\/]\.(git|hg|svn|bzr)$',
	\ 'file': '\v\.(exe|so|dll)$',
\ }

source ~/.vim/comment.vim
source ~/.vim/guids.vim
source ~/.vim/moc.vim
source ~/.vim/bundle/a.vim
"source C:/Program Files (x86)/vim/vimfiles/ftplugin/python/pep8.vim
syntax on

" Cursorline {{{
augroup cursorline
	autocmd!

	"au WinLeave,InsertEnter * set nocursorline
	au WinEnter,InsertLeave * set cursorline

	"au WinLeave,InsertEnter * set nocursorcolumn
	"au WinEnter,InsertLeave * set cursorcolumn

	hi CursorLine guibg=#202020
augroup end
" }}}

" Remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e
