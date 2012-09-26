filetype off                   " required!
" if you have no Vundle, please setup it first:
"  git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
 Bundle 'gmarik/vundle'

" original repos on github
 Bundle 'Lokaltog/vim-easymotion'
 Bundle 'scrooloose/nerdtree'
 Bundle 'majutsushi/tagbar'
 Bundle 'Raimondi/delimitMate.git'
 Bundle 'godlygeek/tabular'
 Bundle 'Shougo/neocomplcache'
 Bundle 'vim-scripts/DoxygenToolkit.vim'
 Bundle 'salsifis/vim-transpose'
 Bundle 'tyru/fencview.vim'
 Bundle 'c9s/cpan.vim'
 Bundle 'c9s/perlomni.vim'
 Bundle 'vim-scripts/buffergrep'

 Bundle 'MarcWeber/vim-addon-mw-utils'
 Bundle 'tomtom/tlib_vim'
 Bundle 'honza/snipmate-snippets'
 Bundle 'garbas/vim-snipmate'
" vim-scripts repos
 Bundle 'a.vim'
 Bundle 'Align'
 Bundle 'bufexplorer.zip'
 Bundle 'EnhCommentify.vim'
 Bundle 'FencView.vim'
 Bundle 'mru.vim'
 Bundle 'matchit.zip'
 Bundle 'python_match.vim'
 Bundle 'OmniCppComplete'
 Bundle 'SearchComplete'
 Bundle 'CRefVim'
 Bundle 'stlrefvim'

 Bundle 'surround.vim'
 Bundle 'repeat.vim'

 Bundle 'L9'
 Bundle 'FuzzyFinder'
 filetype plugin indent on     " required!
 " Brief help for Vundle
 " :BundleList          - list configured bundles
 " :BundleInstall(!)    - install(update) bundles
 " :BundleSearch(!) foo - search(or refresh cache first) for foo
 " :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Bundle command are not allowed..

 syntax on
 
 if ($TERM == "vt100")
    " xterm-color / screen
    set t_Co=8
    set t_AF=[1;3%p1%dm
    set t_AB=[4%p1%dm
 endif

 if ($TERM == 'screen')
    "exe "set title titlestring=" . hostname() . ":vim(%f)"
    "exe "set title t_ts=\<ESC>k t_fs=\<ESC>\\"
    autocmd BufEnter * exec ":silent !echo -e '\033kvim(%)\033\\'\<CR>"
 endif

 let &titleold=hostname() . ":" . getcwd()
 
 if !has('win32') && !has('win64')
    set term=$TERM       " Make arrow and other keys work
 endif
 
 if filereadable($VIMRUNTIME . "/vimrc_example.vim")
    so $VIMRUNTIME/vimrc_example.vim
 endif
 
 set nocompatible
 set wildmenu
 set backupdir=~/tmp,.,/var/tmp/vi.recover,/tmp
 set directory=~/tmp,/var/tmp/vi.recover,/tmp,.
 set backup      " keep a backup file
 
 set linebreak
 set list
 set listchars=tab:>-,trail:-
 
 set cmdheight=2
 
 set number
 set tabstop=4
 set softtabstop=4
 set shiftwidth=4
 set expandtab
 set smarttab
 set backspace=indent,eol,start

 set fencs=utf-8,ucs-bom,big5,shift-jis,gb18030
 set tabpagemax=8
 set showtabline=2 "always show tabline
 set tags+=~/tags
 set foldmethod=manual

 highlight SpecialKey ctermfg=DarkGray guifg=#404040
 highlight LineNr     cterm=bold ctermfg=Brown ctermbg=Black guibg=Darkgrey
 highlight Comment      term=bold ctermfg=Darkcyan
 "for neocomplcache
 highlight PmenuSel ctermbg=Red guifg=#dddd00 guibg=#1f82cd 

 if has("win32") || has("win64")
    colorscheme desert
    set guifont=Consolas:h12, MingLiu:h12
 else
    set guifont=Courier\ 12
 endif

"hotkeys
 nnoremap <F7>  :if exists("syntax_on") <BAR>
    \   syntax off <BAR><CR>
    \ else <BAR>
    \   syntax enable <BAR>
    \ endif <CR>
 inoremap <silent> <F8>  <C-O>:TagbarToggle<CR>
 nnoremap <silent> <F8>  :TagbarToggle<CR>
 nnoremap <F11> :%!xxd<CR>
 nnoremap <F12> :%!xxd -r<CR>

 "key-mappings for neocomplcache
 inoremap <expr><C-g>     neocomplcache#undo_completion()
 inoremap <expr><C-l>     neocomplcache#complete_common_string()
 " <CR>: close popup and save indent.
 inoremap <expr><CR>  pumvisible() ? "\<C-y>" : "\<CR>"
 " <TAB>: completion. (conflicts with snipmate)
 "inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
 " <C-h>, <BS>: cancel popup and delete backword char.
 inoremap <expr><C-h> neocomplcache#cancel_popup()."\<C-h>"
 inoremap <expr><BS> neocomplcache#cancel_popup()."\<C-h>"
 inoremap <expr><C-y>  neocomplcache#smart_close_popup()
 inoremap <expr><C-e>  neocomplcache#cancel_popup()
 inoremap <expr><Left>  neocomplcache#cancel_popup()."\<Left>"
 inoremap <expr><Right>  neocomplcache#smart_close_popup()."\<Right>"
 inoremap <expr><Up>    pumvisible() ? "\<Up>" : neocomplcache#cancel_popup()."\<Up>"
 inoremap <expr><Down>  pumvisible() ? "\<Down>" : neocomplcache#cancel_popup()."\<Down>"

 "hotkeys followed by <Leader>
 let mapleader = ","
 nnoremap <silent> <Leader>t :TagbarToggle<CR>
 nnoremap <silent> <Leader>n :NERDTreeToggle<CR>
 nnoremap <silent> <Leader><Leader> :NeoComplCacheToggle<CR>
 nnoremap <Leader>p :set invpaste paste?<CR>
 nnoremap <Leader>ff :FufFile<CR>
 nnoremap <Leader>ft :FufTag<CR>
 nnoremap <Leader>dd :Dox<CR>
 nnoremap <Leader>da :DoxAuthor<CR>
 nnoremap <silent> <Leader>l :set invnumber invlist list?<CR>
 nnoremap <silent> <Leader>fe :FencView<CR>
 "<Leader>tr: go to STL documentation 
 "<Leader>cr: go to C documentation 
 "<Leader><Leader>e: easyMotion
 "<Leader>be: open bufexplorer
 "<Leader>Bgrep: search in buffers
 "<Leader>Tgrep: search in tabs

 "correct typos
 cnoreabbrev Q q
 cnoreabbrev Wq wq
 cnoreabbrev neo NeoComplCacheToggle
 cnoreabbrev ncc NeoComplCacheToggle

 "setting for tagbar
 let g:tagbar_width = 26
 let g:tagbar_iconchars = ['▾', '▸']
 let g:tagbar_autoshowtag = 1
 if executable("ptags.pl")
     let g:tagbar_type_perl = {
         \ 'ctagsbin' : "ptags.pl",
         \ 'ctagsargs' : '-f -',
         \ 'kinds' : [
             \ 'p:packages:1:0',
             \ 'c:constants:0:0',
             \ 'f:formats:0:0',
             \ 'l:labels',
             \ 's:subroutines',
             \ 'v:variables',
         \ ],
     \ }
 endif

"settings for neocomplcache
 " Do not use neocomplcache at startup
 let g:neocomplcache_enable_at_startup = 0
 " Use smartcase.
 let g:neocomplcache_enable_smart_case = 1
 " Use underbar completion.
 let g:neocomplcache_enable_underbar_completion = 1
 " Set minimum syntax keyword length.
 let g:neocomplcache_min_syntax_length = 3
 let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
 let g:neocomplcache_max_list = 20
 let g:neocomplcache_auto_completion_start_length = 2
 "let g:neocomplcache_disable_auto_complete = 1
 
