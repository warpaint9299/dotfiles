if !isdirectory($XDG_DATA_HOME . '/vim/view')
    call mkdir($XDG_DATA_HOME . '/vim/view', 'p')
endif

if !isdirectory($XDG_DATA_HOME . '/vim/backup')
    call mkdir($XDG_DATA_HOME . '/vim/backup', 'p')
endif

" set patchmode=.orig
set viewdir=$XDG_DATA_HOME/vim/view//
set backupdir=$XDG_DATA_HOME/vim/backup//
set backupext=.bak
set relativenumber
set showcmd
set splitright
set splitbelow
set laststatus=0
set ignorecase
set nohlsearch
set encoding=utf-8
set shiftwidth=4
set softtabstop=4
set tabstop=4
set ruler
set nowrap
set history=1000
set backup
set textwidth=80
set autoindent
set smartindent
set fileformats=unix,dos,mac
set noswapfile
set foldlevel=3
set wildmenu
set wildmode=list:longest
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
set clipboard+=unnamedplus
set virtualedit=
set fileencodings=ucs-bom,utf-8,gb18030,cp936,latin1"
set foldmethod=manual
set linebreak
set showmatch
set display=truncate
set guioptions+=b
set ambiwidth=double
set backspace=2
set foldclose=all
set expandtab
set cursorline
set cursorcolumn
set belloff=all
syntax enable
filetype on
filetype plugin on
filetype indent on
colorscheme torte
