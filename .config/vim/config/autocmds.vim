" Return to last edit position when opening files (You want this!)
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Auto load view of folds
autocmd BufWritePre *  mkview
autocmd BufReadPost * loadview
