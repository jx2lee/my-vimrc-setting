" set the runtime path to include Vundle and initialize
" All of your Plugins must be added before the following line
call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go'
Plug 'git://git.wincent.com/command-t.git'
Plug 'honza/vim-snippets'
Plug 'majutsushi/tagbar'
Plug 'nanotech/jellybeans.vim'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
call plug#end()

" Filetype plugin indent on
" NERDTree ON :  "\nt"
map <Leader>nt <ESC>:NERDTree<CR>
let NERDTreeShowHidden=1

" let NERDTreeQuitOnOpen=1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|vendor$',
    \ 'file': '\v\.(exe|so|dll)$'
\ }

" Tag List
filetype on

" Source Explorer
nmap <F8> :SrcExplToggle<CR>
nmap <C-H> <C-W>h
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l

" Details
set nu
set title
set showmatch
set ruler
set backspace=indent,eol,start

" Sysntax highlight
if has("syntax")
 syntax on
endif

" Indent
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set expandtab

" Paste Option
set paste
set mouse-=a

" Use Korean
set encoding=utf-8
set termencoding=utf-8

" Cursor highlight
set cursorline

" Status Bar
set laststatus=2
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

" Search Option
set ignorecase

" Set Cursor Endpoint
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" MarkDown
augroup markdown
    " remove previous autocmds
    autocmd!
    " set every new or read *.md buffer to use the markdown filetype
    autocmd BufRead,BufNew *.md setf markdown
augroup END


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""Language Setting"""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" for Golang
    set updatetime=100

    " 저장할 때 자동으로 formatting 및 import
    let g:go_fmt_command = "goimports"
    let g:go_list_type = "quickfix"
    let g:go_addtags_transform = "camelcase"

    let g:go_autodetect_gopath = 1
    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_generate_tags = 1
    let g:go_highlight_operators = 1
    let g:go_auto_type_info = 1
    let g:go_auto_sameids = 1

    " quickfix 이동 및 open/close
    nnoremap <C-n> :cnext<CR>
    nnoremap <C-p> :cprevious<CR>
    nnoremap <LocalLeader>q :call ToggleQuickfixList()<CR>

    " 테스트 커버리지 검사 및 색깔 표시 토글
    nnoremap <LocalLeader>c :GoCoverageToggle<CR>

    " 자주 쓰는 기능들
    autocmd FileType go nnoremap <Tab>b :GoBuild<CR>
    autocmd FileType go nnoremap <Tab>r :GoRun<CR>
    autocmd FileType go nnoremap <Tab><Tab>r :GoRun %<CR>

    autocmd FileType go nnoremap <Tab>t :GoTest<CR>
    autocmd FileType go nnoremap <Tab><Tab>t :GoTestFunc<CR>
    autocmd FileType go nnoremap <Tab>c :GoCoverageToggle<CR>

" for Python
" for Java
