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
mkdir -p ~/projects

mkdir -p ~/.vim/autoload ~/.vim/bundle
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
cd ~/.vim/bundle/nerdtree
git pull
git clone https://github.com/morhetz/gruvbox.git ~/.vim/bundle/gruvbox
cd ~/.vim/bundle/gruvbox
git pull
git clone https://github.com/tpope/vim-fugitive.git ~/.vim/bundle/fugitive
cd ~/.vim/bundle/fugitive
git pull

wget -O ~/.vim/cscope/cscope_maps.vim "cscope.sourceforge.net/cscope_maps.vim"

sudo apt install libncurses5-dev libgtk2.0-dev libatk1.0-dev libcairo2-dev libx11-dev libxpm-dev libxt-dev python2-dev python3-dev ruby-dev lua5.2 liblua5.2-dev libperl-dev git
sudo apt install build-essential cmake tmux
sudo apt remove vim vim-runtime gvim
git clone https://github.com/vim/vim.git ~/projects
cd ~/projects/vim
./configure --with-features=huge --enable-multibyte --enable-rubyinterp=yes --enable-python3interp=yes --with-python3-config-dir=$(python3-config --configdir) --enable-perlinterp=yes --enable-luainterp=yes --enable-gui=gtk2 --enable-cscope --prefix=/usr/local
make VIMRUNTIMEDIR=/usr/local/share/vim/vim82
sudo make install
git clone https://github.com/tmux-plugins/tpm.git ~/.tmux/plugins/tpm
cd ~/.tmux/plugins/tpm
git pull
git clone https://github.com/ycm-core/YouCompleteMe.git ~/.vim/bundle/YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
git pull
git submodule update --init --recursive
python3 install.py --clangd-completer

echo "**** RUN Prefix + I to install tmux plugins !!! ***"
