set number
let g:solarized_termcolors=256
set background=light
colorscheme solarized
set splitbelow

let NERDTreeWinSize = 45

" Plugins
call plug#begin('~/.vim/plugged')
Plug 'https://github.com/scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/tpope/vim-fugitive.git'
call plug#end()

" Airline
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1
