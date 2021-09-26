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
Plugin 'suan/vim-instant-markdown', {'rtp': 'after'} " Markdown visualisation
"Plugin 'neoclide/coc.nvim' " COC

" Theme
"Plugin 'ulwlu/elly.vim' " Theme: https://github.com/ulwlu/elly.vim
"Plugin 'ulwlu/abyss.vim' " Theme: https://github.com/ulwlu/abyss.vim
"Plugin 'morhetz/gruvbox' " Theme: https://github.com/morhetz/gruvbox
Plugin 'srcery-colors/srcery-vim' " Theme: https://github.com/srcery-colors/srcery-vim

" MUST BE AFTER PLUGINS
call vundle#end()
filetype plugin indent on

" Options
set t_Co=256 " Set vim to support 256 colors
let g:airline_theme='luna' " Which theme for the bottom bar

" Instant markdown options - uncomment to override defaults:
let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 0
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
let g:instant_markdown_python = 1

"" ---------------------
"       PARAMETERS
"" ---------------------

" Theme
"let g:elly_termmode="cterm"
colorscheme srcery
" Do not change background color
autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE

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
