" Load vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent execute "!echo vim-plug not detected, downloading vim-plug..."
  silent execute "!sleep 2"
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"vim: ts=4 sw=4
" Download vim-plug:
"curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')
Plug 'ctrlpvim/ctrlp.vim'

Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeTabsToggle', 'NERDTreeTabsOpen', 'NERDTreeToggle'] }

Plug 'jistr/vim-nerdtree-tabs', { 'on': ['NERDTreeTabsToggle', 'NERDTreeTabsOpen', 'NERDTreeToggle'] }

Plug 'majutsushi/tagbar'

Plug 'ciaranm/detectindent'

Plug 'hynek/vim-python-pep8-indent'

"Plug 'millermedeiros/vim-statline'
Plug 'itchyny/lightline.vim'

Plug 'vim-scripts/LargeFile'

Plug 'easymotion/vim-easymotion'

Plug 'fatih/vim-go'

Plug 'nvie/vim-flake8'

Plug 'w0rp/ale'

Plug 'maralla/completor.vim'
call plug#end()

if $TERM == 'xterm-256color' || $TERM == 'putty-256color' || $TERM == 'screen-256color'
            \ || match($TERMCAP, 'Co#256:') == 0 || match($TERMCAP, ':Co#256:') > 0
    set t_Co=256
    set bg=dark
endif
set ts=4
set sw=4
set et
set bg=dark
set hls
set number

set list
set listchars=tab:>-,trail:-

set laststatus=2

" search tags
set tags=./mytags,mytags; " set autochdir

set showtabline=2 " always show tabs

augroup vimrc
    autocmd!
    autocmd VimEnter * let &columns=&columns - 1  "avoid text overflow on some terminals
    autocmd VimResized * let &columns=&columns - 1  "avoid text overflow on some terminals
    autocmd BufReadPost * if exists(":DetectIndent") | exe ":DetectIndent" | endif
augroup END

function! ExtractVariable()
    let name = inputdialog("name please: ")
    if &filetype == 'perl'
        let prefix = "my "
    elseif &filetype == 'vim'
        let prefix = "let "
    elseif &filetype == 'javascript'
        let prefix = "var "
    elseif &filetype == 'lua'
        let prefix = "local "
    else
        let prefix = ""
    endif
    if name != ""
        if &filetype == 'go'
            execute "normal O" . prefix . name . " := "
        else
            execute "normal O" . prefix . name . " = "
        endif
        normal p
        execute (line('.')+1) . ",$s/" . escape(getreg('"'), '/\') . "/" . name . "/"
    endif
endfunction
vnoremap <c-e> y:call ExtractVariable()<cr>

"""Save fat finger errors
command! -bang -nargs=? -complete=file Wq wq<bang> <args>
command! -bang Q q<bang>

"""some shortcuts
let mapleader = ","
nnoremap <silent> <Leader>p :set invpaste paste?<CR>i
nnoremap <silent> <Leader>l :set invnumber invlist list?<CR>
nnoremap <silent> <Leader>n :NERDTreeTabsToggle<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>
inoremap <silent> <Leader>t <C-O>:TagbarToggle<CR>


"""" Plugin-specific configurations

""" Tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_indent = 1
let g:tagbar_show_linenumbers = 1 " absolute line num
let g:tagbar_autoshowtag = 1
let g:tagbar_compact = 1 " no help msg

"""ctrlp.vim
" open file in new tab
let g:ctrlp_prompt_mappings = {
             \ 'AcceptSelection("e")': ['<c-r>', '<c-e>', '<2-LeftMouse>'],
             \ 'AcceptSelection("t")': ['<cr>', '<c-t>'],
             \ }
let g:ctrlp_max_depth = 5
let g:ctrlp_max_files = 5000
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll|jpg|png|gif|docx?|pptx?|xlsx?|bin|pdf|pyc|class|swp)$',
    \ }
let g:ctrlp_user_command = {
    \ 'types': {
        \ 1: ['.git', 'cd %s && git ls-files -co --exclude-standard'],
        \ 2: ['.hg', 'hg --cwd %s locate -I .'],
        \ },
    \ 'fallback': 'find %s -type f'
    \ }

"""EasyMotion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Move to end of word
map <Leader>e <Plug>(easymotion-bd-e)

"""NerdTree
let g:nerdtree_tabs_focus_on_files = 1
let g:nerdtree_tabs_autoclose = 1
let g:NERDTreeWinSize = 26
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '*'
" let g:NERDTreeMapOpenInTab='<ENTER>'

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }"

"""vim-flake8
let g:flake8_show_in_file=1

"""completer.vim
let g:completor_min_chars=2
" map right arrow to enter
inoremap <expr> <right> pumvisible() ? "<Enter>" : "<right>"
