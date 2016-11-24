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
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Color scheme
let g:solarized_termcolors=256
set background=light
colorscheme solarized
set colorcolumn=100

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'https://github.com/benekastah/neomake'
Plug 'https://github.com/Shougo/deoplete.nvim'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/vim-airline/vim-airline-themes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-fugitive.git'
Plug 'NLKNguyen/pipe.vim'
Plug 'NLKNguyen/pipe-mysql.vim'
call plug#end()

" Neomake
autocmd! BufWritePost,BufEnter * Neomake
let g:neomake_python_flake8_maker = {}

" Deoplete
let g:deoplete#enable_at_startup = 1

" Airline
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
