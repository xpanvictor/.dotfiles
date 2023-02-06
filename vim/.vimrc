" swap configuration
set backup
if !isdirectory($HOME."/.vim/backupdir")
    silent! execute "!mkdir ~/.vim/backupdir"
endif
set backupdir=~/.vim/backupdir
"not generate .swap
set noswapfile

set number

" persistent undo across all files
set undofile
if !isdirectory($HOME."/.vim/undodir")
	call mkdir("$HOME/.vim/undodir", "p")
endif
set undodir="$HOME/.vim/undodir"
