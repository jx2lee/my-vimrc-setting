# Vimrc & zshrc setting for jx2lee
`just backup.`

## .vimrc

```vim
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

```

### After setting the `.vimrc`...

* Run `cp -r .vimrc ~/.vimrc`
* Run `vim +PluginInstall`
=======
* If you already have Vundle,
  * `cp .vimrc ~/.vimrc && vim +PluginInstall +qall`
* else,
  * `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
  * `cp .vimrc ~/.vimrc && vim +PluginInstall`


## .zshrc

```vim
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/nhn/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(git)
plugins=(
	git
	zsh-autosuggestions
	zsh-syntax-highlighting
	fzf
)
source $ZSH/oh-my-zsh.sh
ZSH_DISABLE_COMPFIX="true"

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /Users/nhn/.oh-my-zsh/themes/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#***************************************************************************#
#***************************************************************************#

# Toast cloud
export KEY_PATH=/Users/nhn/workspace/toast-cloud/jx2lee.pem
alias toast-conn-master="ssh -i $KEY_PATH centos@133.186.213.49"
alias toast-conn-k8s-svc="ssh -i $KEY_PATH centos@133.186.217.62"
alias toast-conn-instance="ssh -i $KEY_PATH centos@133.186.241.218"

# Hadoop Client
export HADOOP_HOME=/Users/nhn/workspace/bigdata/hadoop-client/hadoop-2.10.1
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export HADOOP_COMMON_LIB_NATIVE_DIR=${HADOOP_HOME}/lib/native
export HADOOP_OPTS="${HADOOP_OPTS} -Djava.library.path=${HADOOP_HOME}/lib"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_261.jdk/Contents/Home
export PATH=$PATH:$JAVA_HOME/bin:$HADOOP_HOME/bin:$HADOOP_HOME/sbin

# Hexo
alias deploy-algolia="export HEXO_ALGOLIA_INDEXING_KEY=dee49d5f8367c0f900b64906cfe42f19; hexo algolia"

#***************************************************************************#
#***************************************************************************#

# Golang
export GOPATH=/Users/nhn/workspace/programming/go
export PATH=$PATH:$(go env GOPATH)/bin

# Python
eval "$(pyenv init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/sqlite/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/sqlite/include"

export WORKON_HOME=~/workspace/programming/python/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=$(pyenv which python3)
source ~/.pyenv/versions/3.7.9/bin/virtualenvwrapper.sh

# Nodejs
export NVM_DIR=$HOME/.nvm
alias set-node="source $NVM_DIR/nvm.sh;source $NVM_DIR/bash_completion"

# MySQL
export PATH=$PATH:/usr/local/opt/mysql@5.7/bin

# Common Alias
alias cat='bat'

```

---
*made by jaejun.lee*