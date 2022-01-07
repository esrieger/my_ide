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
set nomodeline
set laststatus=2

" faster scrolling
noremap <C-j> 8j
noremap <C-k> 8k

" duplicate tab
noremap <C-d><C-t> :tab split<CR>

" search visually selected text
vnoremap // y/\V<C-R>=escape(@",'/\')<CR><CR>

" Set undofile to persist undo
set undofile
" swap, backup, and undo locations
set backupdir=~/.vim/backupfiles
set directory=~/.vim/directoryfiles
set undodir=~/.vim/undodirfiles

" YouCompleteMe
set completeopt-=preview
map <C-y><C-r> :YcmRestartServer<CR>
map <C-y><C-y> :YcmCompleter 
let g:ycm_always_populate_location_list = 1
nmap <leader>fw <Plug>(YCMFindSymbolInWorkspace)
nmap <leader>fd <Plug>(YCMFindSymbolInDocument)

" Statusline configuration
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \             [ 'ycm-status' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'ycm-status': 'YcmStatus',
      \ },
      \ }

" YCM statusline function
function! YcmStatus()
  return 'Warnings: ' . youcompleteme#GetWarningCount() .
        \ ' Errors: ' . youcompleteme#GetErrorCount()
endfunction

" Vim Fugitive replace capitalizations
cnoreabbrev GPull Gpull
cnoreabbrev GPush Gpush

" fix background issue
if &term =~ '256color'
  " disable Background Color Erase (BCE) so that color schemes
  " render properly when inside 256-color tmux and GNU screen
  " see also http://snk.tuxfamily.org/log/vim-256color-bce.html
  set t_ut=
endif

" Cscope
source ~/.vim/cscope/cscope_maps.vim
set tags=tags
" map <C-l> :TlistToggle<CR>
" map <C-w><C-t> <C-w><C-]><C-w>T

" gruvbox colorscheme
colorscheme gruvbox
set background=dark

" NERDTree
map <C-n> :NERDTreeToggle<CR>
