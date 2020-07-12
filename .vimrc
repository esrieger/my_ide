filetype plugin indent on
syntax on
execute pathogen#infect()
execute pathogen#helptags()

set shiftwidth=2
set tabstop=2
set expandtab
set bs=2
set ruler
set number

set hlsearch
set ignorecase
set smartcase
set incsearch
set nocp
set nocompatible

" faster scrolling
noremap <C-j> 8j
noremap <C-k> 8k

" duplicate tab
noremap <C-d><C-t> :tab split<CR>

" search visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" YouCompleteMe
set completeopt-=preview
map <C-Y> :YcmRestartServer<CR>

" Cscope
source ~/.vim/cscope/cscope_maps.vim
set tags=tags
" map <C-l> :TlistToggle<CR>
" map <C-w><C-t> <C-w><C-]><C-w>T

" Fix backround issue
if &term =~ '256color'
  " Disable Background Color Erase (BCE) so that color schemes
  " work properly when Vim is used inside tmux and GNU screen.
  set t_ut=
endif

" gruvbox colorscheme
colorscheme gruvbox
set background=dark

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" swap, backup, and undo locations - TBD
set backupdir=~/.vim/backupfiles
set directory=~/.vim/directoryfiles
set undodir=~/.vim/undodirfiles
