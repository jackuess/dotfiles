" General stuff
syntax on
set number
set cursorline
set nowrap
tnoremap <Esc> <C-\><C-n>
set splitbelow
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
set list
set clipboard=unnamedplus

" Color scheme
let g:solarized_termcolors=256
set background=light
colorscheme solarized
set colorcolumn=100

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-fugitive.git'
call plug#end()

" Airline
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
