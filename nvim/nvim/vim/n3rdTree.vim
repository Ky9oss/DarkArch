" Nerd Tree
"" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
"" If a file is specified, open nerdtree in its path
autocmd VimEnter * if argc() > 0 && filereadable(argv(0)) | exec "cd " . fnamemodify(argv(0), ":p:h") | NERDTreeFind | endif
"" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
