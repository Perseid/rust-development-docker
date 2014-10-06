"show numbers on all lines
set number

" add expansion of %%
" see http://vim.wikia.com/wiki/Easy_edit_of_files_in_the_same_directory
cabbr <expr> %% expand('%:p:h')

" if colors are available
if &t_Co > 2 || has("gui_running")
	" enable syntax highlighting
	syntax on
	" highlight matches
	set hlsearch
endif

" automatically indent lines 
set noautoindent

" especially after { etc.
"set smartindent
" select case-insenitiv search (not default)
set ignorecase

" show cursor line and column in the status line
set ruler

" show matching brackets
set showmatch

" display mode INSERT/REPLACE/...
set showmode

" display partial commands
set showcmd

" changes special characters in search patterns (default)
" set magic

" Required to be able to use keypad keys and map missed escape sequences
set esckeys

" get easier to use and more user friendly vim defaults
" CAUTION: This option breaks some vi compatibility. 
"          Switch it off if you prefer real vi compatibility
set nocompatible

" allow backspacing over everything in insert mode 
set backspace=indent,eol,start

" Complete longest common string, then "try again" - for bash like behaviour, 
" then list all entries, than choose full match from menu
" enable this for bash compatible behaviour
set wildmode=longest,longest,list,full
set wildmenu

" Longer history can't hurt.
set history=200

" Enable file type detection
filetype plugin indent on

" For security reasons: disallow modelines
set nomodeline
" Last but not least: lock all dangerous options
set secure
