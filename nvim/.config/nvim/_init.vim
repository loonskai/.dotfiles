set scrolloff=8
set number
set relativenumber
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set background=dark

call plug#begin("~/.vim/plugged")
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ellisonleao/gruvbox.nvim'
Plug 'tpope/vim-fugitive'
call plug#end()

colorscheme gruvbox

let mapleader = " "
nnoremap <leader>pv :Vex<CR>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>
nnoremap <C-p> :Gfiles<CR>
nnoremap <leader>pf :Files<CR> " Fallback if directory has no .git
nnoremap <C-j> :cnext<CR>
nnoremap <C-k> :cprev<CR>

inoremap jk <esc> " Escape INSERT mode with jk

vnoremap <leader>y "+y
