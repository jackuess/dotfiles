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
set mouse=a

" vim-plug
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'NLKNguyen/pipe.vim'
Plug 'NLKNguyen/pipe-mysql.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-jedi'
Plug 'carlitux/deoplete-ternjs'
Plug 'cloudhead/neovim-fuzzy'
Plug 'w0rp/ale'
Plug 'machakann/vim-highlightedyank'
Plug 'vitalk/vim-simple-todo'
call plug#end()

" Color
set termguicolors
set background=light
colorscheme gruvbox
set colorcolumn=100

" Tree view liststyle in netrw
let g:netrw_liststyle = 3

" Close preview after auto completion
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Deoplete
let g:deoplete#enable_at_startup = 1

" Airline
let g:airline_theme='bubblegum'
let g:airline_powerline_fonts = 1

" novim-fuzzy
nnoremap <C-p> :FuzzyOpen<CR>

" vim-simple-todo
let g:simple_todo_tick_symbol = '✔'
