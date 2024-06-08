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
set shortmess-=S

" faster scrolling
noremap <C-j> 8j
noremap <C-k> 8k

" Random fix to avoid starting in replace mode on startup
" when not in tmux
nnoremap <esc>^[ <esc>^[

" duplicate tab
noremap <C-d><C-t> :tab split<CR>

" Set undofile to persist undo
set undofile
" swap, backup, and undo locations
set backupdir=~/.vim/backupfiles
set directory=~/.vim/directoryfiles
set undodir=~/.vim/undodirfiles

" Statusline configuration
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ], ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \ },
      \ }

" Vim Fugitive replace capitalizations
cnoreabbrev GPull Gpull
cnoreabbrev GPush Gpush
if ((getcwd() =~ '\/mnt\/c') == 1)
  let g:fugitive_git_executable = 'git.exe'

  " set the temporary directory to windows path so windows git
  " can access chunks
  let $TMPDIR='/mnt/c/Users/erieger' . '/vim_tmp'
endif

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

" Change vim update time for Git gutter
set updatetime=100

" coc.nvim
set encoding=utf-8
set signcolumn=yes
" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" enter to complete
inoremap <silent><expr> <NUL> coc#pum#visible() ? coc#pum#insert() : coc#refresh()

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" enable fzf
set rtp+=~/.fzf
cnoreabbrev fzf FZF
noremap <C-d><C-f> :FZF<CR>

" enable spellchecking
set spell spelllang=en_us
