
call plug#begin()
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdtree'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf.vim'
call plug#end()

set clipboard+=unnamedplus
"!-~,^*,^|,^",192-255
"set iskeyword=a-z
set virtualedit=
set guioptions+=b
set fileformats=unix,dos,mac
set textwidth=80
set helplang=cn
set ambiwidth=double
set background=dark
set backspace=2
set laststatus=2
"把所有的数字当理解成十进制 00 or 0x
set nrformats=
set ts=4 sw=4 expandtab
"如果末行被截短，显示 @@@ 而不是隐藏整行
set display=truncate
set nrformats-=octal
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,gb18030,cp936,latin1
set history=10000
set foldmethod=syntax
set relativenumber number
set cursorline
set cursorcolumn
set nohlsearch
set showcmd
set linebreak
set showmatch
set autoindent
set ruler
set incsearch
set ignorecase
set hlsearch
set noswapfile
set cursorline
set autowrite

set splitright
set splitbelow
set nowrap
" vim 启动时不折叠 za 打开或者关闭所有折叠 zM 关闭所有折叠 zR 打开所有折叠
set nofoldenable
let g:vimspector_enable_mappings = 'HUMAN'
let g:mapleader = '`'
colorscheme gruvbox

filetype indent on
syntax enable
au bufreadpost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" :map 递归映射
" :noremap 非递归映射
" :nnoremap 正常模式映
" :vnoremap 可视模式和选择模式映射
" :xnoremap 可视模式映射
" :snoremap 选择模式映
" :onoremap 操作待决模式映射
" :noremap! 插入和命令模式映射
" :inoremap 插入模式映射
" :cnoremap 命令模式映射

"noremap
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
inoremap jk <esc>

nmap tt :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="right"
let NERDTreeShowHidden=0
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's anways complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
