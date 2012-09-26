" If no screen, use color term
if ($TERM == "vt100")
  " xterm-color / screen
  set t_Co=8
  set t_AF=[1;3%p1%dm
  set t_AB=[4%p1%dm
endif

if filereadable($VIMRUNTIME . "/vimrc_example.vim")
 so $VIMRUNTIME/vimrc_example.vim
endif

if filereadable($VIMRUNTIME . "/macros/matchit.vim")
 so $VIMRUNTIME/macros/matchit.vim
endif

syntax on

set nocompatible
set wildmenu
set backupdir=~/tmp,.,/var/tmp/vi.recover,/tmp
set directory=~/tmp,/var/tmp/vi.recover,/tmp,.
set backup		" keep a backup file
" set textwidth=78
" set shiftwidth=4
set bs=2		" allow backspacing over everything in insert mode
" set ai			" always set autoindenting on
set viminfo='20,\"50	" read/write a .viminfo file, don't store more
set showmatch
set dictionary-=/usr/share/dict/words dictionary+=/usr/share/dict/words "dictionary


set ts=4
set sw=4
"set expandtab   "replace tab with spaces

"line number
set number
"if version >= 700
"	set cursorline
"endif
"set hlsearch
set hls
set cmdheight=2

"方便indent
nmap <tab> V>
nmap <s-tab> V<
xmap <tab> >gv
xmap <s-tab> <gv
"filetype indent on
"au FileType yacc so ~/.vim/indent/yacc.vim
"au FileType html so ~/.vim/indent/html.vim
"空白或標點符號的地方來折行
set linebreak
"set background=dark	" another is 'light'
set bg=light

set list
set listchars=tab:>-,trail:-
highlight SpecialKey ctermfg=DarkGray guifg=#404040
highlight LineNr     cterm=bold ctermfg=Brown ctermbg=Black guibg=Darkgrey guifg=Brown
hi cursorline cterm=underline

" VIM 6.0,
if version >= 600
    " set nohlsearch
    " set foldcolumn=2
    " set foldmethod=syntax
    set foldmethod=marker
    set foldlevel=1
    "set foldtext=/^/=>
    " set encoding=utf-8
    " set fileencoding=big5
    " set termencoding=big5
	
	"set encoding=utf-8
    set encoding=big5
	set termencoding=big5
    " set fileencodings=latin,big5,ucs-bom,utf-8,sjis,big5
    " set fileencodings=ucs-bom,utf-8,sjis,big5,latin1
    " set fileencodings=utf-8,sjis,big5,latin1
    set fileencodings=utf-8,big5,euc-jp,gbk,euc-kr,utf-bom,iso8859-1
else
    set fileencoding=taiwan
endif
nnoremap <silent> <F8> :TlistToggle<CR>
"syntax switch
nmap <F7> :if exists("syntax_on") <BAR>
	\   syntax off <BAR><CR>
	\ else <BAR>
	\   syntax enable <BAR>
	\ endif <CR>
nmap <F11> :%!xxd<CR>
nmap <F12> :%!xxd -r<CR>    

let mapleader = ","
nnoremap <C-p> :bprev<Return>
nnoremap <C-n> :bnext<Return>
nnoremap <Leader>t :Tlist<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>
nnoremap <Leader>m :MarksBrowser<CR>
nnoremap <Leader>p :set invpaste paste?<CR>
nnoremap <Leader>u :UpdateTypesFile!<CR>



helptags ~/.vim/doc
filetype plugin indent on

"taglist
let Tlist_Exit_OnlyWindow = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Use_Right_Window = 1 
"let Tlist_Ctags_Cmd = '/usr/bin/ctags'

"Doxygen
let g:DoxygenToolkit_briefTag_pre="@Synopsis  " 
let g:DoxygenToolkit_paramTag_pre="@Param " 
let g:DoxygenToolkit_returnTag="@Returns   " 
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------" 
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------" 
let g:DoxygenToolkit_authorName="Mew109" 
let g:DoxygenToolkit_licenseTag="Copyright Reserved"

"vimplate
let Vimplate = "$HOME/.vim/vimplate" 


"" Show the buffer number in the status line.
"set laststatus=2 statusline=%02n:%<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

"color

"------------------------------------------
syn keyword Datatype String UserInfo User Request 
hi Datatype ctermfg=Green


"----------------------------------------

nnoremap <C-G>   :noautocmd vimgrep /<C-R>=expand("<cword>")<CR>/ %<CR>
hi Comment      term=bold ctermfg=Darkcyan
