" -------------------------------------------------------------------
" |     map     |   unmap   |          discription                  |
" -------------------------------------------------------------------
" |   noremap   |   unmap   |   Normal, Visual and Operator−pending |
" |   vnoremap  |   vunmap  |   Visual                              |
" |   nnoremap  |   nunmap  |   Normal                              |
" |   onoremap  |   ounmap  |   Operator−pending                    |
" |   noremap!  |   unmap!  |   Insert and Command−line             |
" |   inoremap  |   iunmap  |   Insert                              |
" |   cnoremap  |   cunmap  |   Command−line                        |
" -------------------------------------------------------------------

let g:mapleader = " "
inoremap jk <Esc>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>
inoremap <C-l> <RIGHT>
nnoremap <silent> <C-s> :w<CR>
nnoremap <silent> <C-UP> :horizontal resize +5<CR>
nnoremap <silent> <C-DOWN> :horizontal resize -5<CR>
nnoremap <silent> <C-LEFT> :vertical resize +10<CR>
nnoremap <silent> <C-RIGHT> :vertical resize -10<CR>
nnoremap <silent> <S-c> :close<CR>
nnoremap <silent> <F2> :set relativenumber! number!<CR>
nnoremap <silent> <leader>no :set hlsearch!<CR>
