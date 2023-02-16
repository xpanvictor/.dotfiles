

" swap configuration
set backup
if !isdirectory($HOME."/.vim/backupdir")
    silent! execute "!mkdir ~/.vim/backupdir"
endif
set backupdir=~/.vim/backupdir
"not generate .swap
set noswapfile

set number
set tabspace=4

" persistent undo across all files
set undofile
if !isdirectory($HOME."/.vim/undodir")
	silent! execute "!mkdir ~/.vim/undodir"
endif
set undodir="$HOME/.vim/undodir"


" plugin section
packloadall		" load all plugins
silent! helptags ALL	" load help files for all plugins

" Fast split navigation <c> + hjkl
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

