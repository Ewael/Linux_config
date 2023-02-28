" ~/.vimrc

"" ---------------------
"        PLUGINS
"" ---------------------

" vim-plug is for plugin installation
call plug#begin()
Plug 'preservim/NERDTree'

" Plugins
Plug 'ntpeters/vim-better-whitespace' " Highlight useless spaces
Plug 'vim-airline/vim-airline' " Color on bottom bar
Plug 'vim-airline/vim-airline-themes' " Themes for vim-airline
Plug 'ycm-core/YouCompleteMe' " Auto-completion plugin

" MUST BE AFTER PLUGINS
call plug#end()
filetype plugin indent on

" Options
let g:airline_theme='luna' " Theme for bottom bar

"" ---------------------
"       PARAMETERS
"" ---------------------

set encoding=utf-8

syntax on
set number " Line numbers
set cc=80 " Red column

set showbreak=+++
set showmatch
set list listchars=tab:>\ ,trail:-

set hlsearch
set smartcase
set ignorecase
set incsearch

set autoindent
set cindent
set expandtab
set shiftwidth=4
set smartindent
set smarttab
set softtabstop=4

set ruler

set undolevels=1000
set backspace=indent,eol,start

" Auto scrolling
let &scrolloff = winheight(0) / 5

"" ---------------------
"       FUNCTIONS
"" ---------------------

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

"" ---------------------
"       REMAPPING
"" ---------------------

" Save
map <F3> :w <CR>
" Quit and save
map <F4> :x <CR>
" Remove all trailling space
map <F6> :StripWhitespace <CR>
" Reindent all the file
map <F7> gg=G <CR>
" Quit without saving
map <F8> :q! <CR>
" Launch the plugin install
map <F9> :PluginInstall <CR>
" Switch between relative number and absolute number
map <F10> :call ToggleNumber() <CR>
