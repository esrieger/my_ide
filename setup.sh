#!/bin/bash

cp .vimrc ~/
cp .bashrc ~/
cp .tmux.conf ~/
cp .gitconfig ~/
cp .gitignore ~/

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

wget -O ~/.vim/cscope/cscope_maps.vim "cscope.sourceforge.net/cscope_maps.vim"

git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
sudo apt install build-essential cmake vim python3-dev tmux
cd ~/.vim/bundle/YouCompleteMe
git submodule update --init --recursive
python3 install.py --clangd-completer

echo "**** RUN Prefix + I to install tmux plugins !!! ***"
