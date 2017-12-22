set t_Co=256

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath^=~/.vim/bundle/vim-gitgutter
set runtimepath^=~/.vim/bundle/lightline.vim
set runtimepath^=~/.vim/bundle/YouCompleteMe
set completeopt-=preview
let g:ctrlp_working_path_mode = 'a'
let g:lightline = {
	\ 'colorscheme': 'wombat',
	\ }
set laststatus=2
set secure
set exrc
set encoding=utf-8
setglobal fileencoding=utf-8

set errorformat=
  \%f:%l:%c:{%*[^}]}:\ error:\ %m,
  \%f:%l:%c:{%*[^}]}:\ fatal\ error:\ %m,
  \%f:%l:%c:{%*[^}]}:\ warning:\ %m,
  \%f:%l:%c:\ error:\ %m,
  \%f:%l:%c:\ fatal\ error:\ %m,
  \%f:%l:%c:\ warning:\ %m,
  \%f:%l:\ error:\ %m,
  \%f:%l:\ fatal\ error:\ %m,
  \%f:%l:\ warning:\ %m
 
set wildmenu
set wildmode=full
set wildignore+=*.o,*.obj,.git,.svn,build,*.pyc,*.jpg,*.png,*.gif,*.d,Pods/Headers,Pods/BuildHeaders,_site
let g:ycm_confirm_extra_conf = 0
 
set nohidden
set nohlsearch
 
filetype indent off
set autoindent                                                                                                                    
set copyindent
set smartindent
if v:version > 704 || v:version == 704 && has("patch338")
	" Patch 7.4.338, after wrapping lines, indent the wrapping lines too! Thanks to Chris Brabandt for fix.
	set breakindent
endif
set nowrap
set noexpandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
 
set scrolloff=5
set sidescrolloff=5
if &compatible | set nocompatible | endif
set ttyfast
set noerrorbells
set incsearch
set smartcase
set showmatch
set diffopt=filler,iwhite
set background=dark
set autoread
set history=1000
set undolevels=1000
set nobackup
set noswapfile
set title
set noruler
set shortmess+=Ia
set ttimeoutlen=0
set magic
set t_ti= t_te=
set synmaxcol=900
 
set cursorline
set cursorcolumn

color ron
syntax on
hi ErrorMsg ctermfg=Red ctermbg=Black
hi Error ctermfg=Red ctermbg=Black
hi SpellBad ctermfg=Red ctermbg=Black
hi SpellCap ctermfg=0 ctermbg=11
hi Cursor ctermbg=white
hi CursorLine ctermbg=black cterm=none
hi CursorColumn ctermbg=black
hi MatchParen ctermbg=black ctermfg=red
hi DiffAdd term=reverse cterm=bold ctermbg=green ctermfg=white 
hi DiffChange term=reverse cterm=bold ctermbg=cyan ctermfg=white 
hi DiffText term=reverse cterm=bold ctermfg=15 ctermbg=4
hi DiffDelete term=reverse cterm=bold ctermbg=red ctermfg=white 
hi Todo term=standout ctermfg=11 ctermbg=0
hi YcmWarningSection term=standout ctermfg=11 ctermbg=0
 
set backspace=indent,eol,start
set whichwrap=h,l,~,[,]
 
nnoremap j gj
nnoremap k gk
set pastetoggle=<F2>
cmap w!! w !sudo tee % >/dev/null
 
ia teh      the
ia htis     this
ia tihs     this
ia funciton function
ia fucntion function
ia funtion  function
ia retunr   return
ia reutrn   return
ia sefl     self
ia eslf     self

set noshowmode

" Switch editing between .c* and .h* files (and more).
function! Mosh_Flip_Ext()
	" Since .h file can be in a different dir, call find.
	if match(expand("%"),'\.c') > 0
		let s:flipname = substitute(expand("%"),'\.c\(.*\)','.h',"")
	elseif match(expand("%"),"\\.h") > 0
		let s:flipname = substitute(expand("%"),'\.h\(.*\)','.cpp',"")
	endif
	exe ":sp " s:flipname
endfun
map <F4> :call Mosh_Flip_Ext()<CR>

" Return to old position when reopening files
if has("autocmd")
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" youcompleteme
Plug 'valloric/youcompleteme'
" ctrlp
Plug 'kien/ctrlp.vim'
" lightline
Plug 'itchyny/lightline.vim'
" vim git-gutter
Plug 'airblade/vim-gitgutter'

" Initialize plugin system
call plug#end()
