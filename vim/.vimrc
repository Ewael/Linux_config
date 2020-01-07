" ~/.vimrc

"" ---------------------
"        PLUGINS
"" ---------------------

" Vundle is for plugin installation
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'ntpeters/vim-better-whitespace' " Remove useless spaces
Plugin 'vim-airline/vim-airline' " Colors on bottom bar
Plugin 'vim-airline/vim-airline-themes' " Theme for vim-airline

" MUST BE AFTER PLUGINS
call vundle#end()
filetype plugin indent on

" Options
set t_Co=256 " Set vim to support 256 colors
let g:airline_theme='luna' " Which theme for the bottom bar



"" ---------------------
"       PARAMETERS
"" ---------------------

set encoding=utf-8

syntax on
set number " Line numbers
set cc=80 " Red column

set showbreak=+++
set showmatch
set list listchars=tab:>-,trail:-

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
