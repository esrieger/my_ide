#!/bin/bash

cp .vimrc ~/
cp .bashrc ~/
cp .tmux.conf ~/
cp .gitconfig ~/
cp .gitignore ~/
cp .zshrc ~/

mkdir -p ~/.vim
mkdir -p ~/.vim/backupfiles
mkdir -p ~/.vim/directoryfiles
mkdir -p ~/.vim/undodirfiles
mkdir -p ~/.vim/cscope
mkdir -p ~/.tmux

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/fugitive

brew install wget cscope

wget -O ~/.vim/cscope/cscope_maps.vim "cscope.sourceforge.net/cscope_maps.vim"

brew install tmux

git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
brew install cmake macvim python
brew install mono go nodejs

cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --all
