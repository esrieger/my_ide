#!/bin/bash
set -euo pipefail

# Resolve the directory this script lives in (the repo root)
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# --- Helper functions ---

git_clone_or_update() {
    local url="$1"
    local dest="$2"
    if [ -d "$dest/.git" ]; then
        echo "Updating $dest..."
        git -C "$dest" pull --ff-only
    else
        echo "Cloning $url -> $dest..."
        git clone "$url" "$dest"
    fi
}

symlink_dotfile() {
    local src="$REPO_DIR/$1"
    local dest="$HOME/$1"

    if [ -L "$dest" ]; then
        echo "Symlink already exists: $dest -> $(readlink "$dest")"
    elif [ -f "$dest" ]; then
        echo "Backing up existing $dest -> ${dest}.bak"
        mv "$dest" "${dest}.bak"
        ln -s "$src" "$dest"
        echo "Symlinked $dest -> $src"
    else
        ln -s "$src" "$dest"
        echo "Symlinked $dest -> $src"
    fi
}

# --- System packages ---
sudo apt update -y
sudo apt install curl vim xclip fd-find -y

# --- Vim directories ---
mkdir -p ~/.vim/{backupfiles,directoryfiles,undodirfiles,cscope,autoload,bundle}

# --- Vim plugin manager ---
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# --- Vim plugins ---
git_clone_or_update https://github.com/preservim/nerdtree.git         ~/.vim/bundle/nerdtree
git_clone_or_update https://github.com/morhetz/gruvbox.git             ~/.vim/bundle/gruvbox
git_clone_or_update https://github.com/esrieger/vim-fugitive.git       ~/.vim/bundle/fugitive
git_clone_or_update https://github.com/itchyny/lightline.vim           ~/.vim/bundle/lightline.vim
git_clone_or_update https://github.com/airblade/vim-gitgutter          ~/.vim/bundle/vim-gitgutter
git_clone_or_update https://github.com/tpope/vim-sleuth.git            ~/.vim/bundle/vim-sleuth
git_clone_or_update https://github.com/neoclide/coc.nvim.git           ~/.vim/bundle/coc.nvim
cd ~/.vim/bundle/coc.nvim && npm ci

# --- Node (required for coc.nvim) ---
curl -sL install-node.vercel.app/lts | sudo bash

# --- fzf ---
git_clone_or_update https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

# --- cscope maps ---
wget -O ~/.vim/cscope/cscope_maps.vim "cscope.sourceforge.net/cscope_maps.vim"

# --- Zellij ---
if apt-cache show zellij &>/dev/null; then
    sudo apt install zellij -y
else
    echo "zellij not in apt, downloading latest binary..."
    ZELLIJ_VERSION=$(curl -s https://api.github.com/repos/zellij-org/zellij/releases/latest | grep '"tag_name"' | cut -d'"' -f4)
    curl -sL "https://github.com/zellij-org/zellij/releases/download/${ZELLIJ_VERSION}/zellij-x86_64-unknown-linux-musl.tar.gz" | sudo tar -xz -C /usr/local/bin
fi

# --- Dotfiles (symlinked back to repo) ---
symlink_dotfile .bashrc
symlink_dotfile .zshrc
symlink_dotfile .vimrc
symlink_dotfile .gitconfig
symlink_dotfile .profile

echo ""
echo "✓ Setup complete."
