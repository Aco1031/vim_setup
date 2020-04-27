"dein Scripts-----------------------------
if &compatible
    set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/maruc/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/Users/maruc/.cache/dein')
    call dein#begin('/Users/maruc/.cache/dein')

    " Let dein manage dein
    " Required:
    call dein#add('/Users/maruc/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/unite.vim')
    call dein#add('Shougo/vimfiler.vim')
    call dein#add('kien/ctrlp.vim')
    call dein#add('tyru/caw.vim')
    call dein#add('soramugi/auto-ctags.vim')
    call dein#add('Shougo/deoplete.nvim')
    call dein#add('neoclide/coc.nvim', {'merge':0, 'rev': 'release'})
    call dein#add('Yggdroot/indentLine')

    call dein#add('Shougo/vimproc.vim', {
        \ 'build': {
        \     'windows' : 'tools\\update-dll-mingw',
        \     'cygwin'  : 'make -f make_cygwin.mak',
        \     'mac'     : 'make -f make_mac.mak',
        \     'linux'   : 'make',
        \     'unix'    : 'gmake',
        \    },
        \ })

    " Required:
    call dein#end()
    call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
    call dein#install()
endif

"End dein Scripts-------------------------

" vimfiler
let g:vimfiler_as_default_explorer = 1
noremap <C-T><C-T> :VimFiler -buffer-name=explorer -split -simple -toggle -winwidth=45 -no-quit<ENTER>

" basement
syntax on
set title
set nu
set cursorline
set ruler
set enc=utf-8
set ignorecase
set wrapscan
set tabstop=4
set autoindent
set expandtab
set shiftwidth=4
set wildmenu
set clipboard+=unnamed

" color config
set background=dark
colorscheme lucius

" keymap
noremap dt diffthis
noremap do diffoff
inoremap <silent> jj <ESC>
imap { {}<LEFT>
imap [ []<LEFT>
imap ( ()<LEFT>
nmap <C-S> :source ~/.config/nvim/init.vim<CR>

" keymap-comment
nmap <C-K> <Plug>(caw:hatpos:toggle)
vmap <C-K> <Plug>(caw:hatpos:toggle)

" keymap-indentLine
nmap <C-I> :IndentLinesToggle<CR>

" keymap-coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use silver-searcher
if executable('ag')
    " Use ag in unite grep source.
    let g:unite_source_grep_command = 'ag'
    let g:unite_source_grep_default_opts =
        \ '-f --vimgrep --hidden --ignore ' .
        \ '''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'''
    let g:unite_source_grep_recursive_opt = ''
endif


