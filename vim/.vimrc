" http://vimdoc.sourceforge.net/htmldoc/starting.html#vimrc
set nocompatible        " use vim defaults
set scrolloff=8         " keep 3 lines when scrolling
set ai                  " set auto-indenting on for programming

set showcmd             " display incomplete commands
set nobackup            " do not keep a backup file
set number              " show line numbers
set relativenumber
set ruler               " show the current row and column

set hlsearch            " highlight searches
set incsearch           " do incremental searching
set showmatch           " jump to matches when entering regexp
set ignorecase          " ignore case when searching
set smartcase           " no ignorecase if Uppercase char present

set visualbell t_vb=    " turn off error beep/flash
set novisualbell        " turn off visual bell

set backspace=indent,eol,start  " make that backspace key work the way it should
set runtimepath=$VIMRUNTIME     " turn off user scripts, https://github.com/igrigorik/vimgolf/issues/129

syntax on               " turn syntax highlighting on by default
filetype on             " detect type of file
filetype indent on      " load indent file for specific file type

set t_RV=               " http://bugs.debian.org/608242, http://groups.google.com/group/vim_dev/browse_thread/thread/9770ea844cec3282

let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Use spaces instead of tabs
set expandtab

" Number of spaces a tab character represents
set tabstop=2

" Number of spaces to use for autoindent and shift commands (>> <<)
set shiftwidth=2

" Number of spaces to insert when you press tab
set softtabstop=2

" --- Colors and UI ---
" Enable true colors if your terminal supports it
" set termguicolors
" Returns true if the color hex value is light
" Keep 8 lines above/below the cursor when scrolling
set scrolloff=8
" Always show the sign column (for linters, debuggers, etc.)
set signcolumn=yes
" Add @ and - to the list of characters allowed in filenames
set isfname+=@-@

" reset the cursor on start (for older versions of vim, usually not required)
" augroup myCmds
" au!
" autocmd VimEnter * silent !echo -ne "\e[2 q"
" augroup END

" autocmd InsertEnter,InsertLeave * set cul!
" autocmd InsertEnter * set cul
" autocmd InsertLeave * set nocul
