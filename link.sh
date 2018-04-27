#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

safe_link () {
    # Makes a backup of the destination file, if it was no link
    if [[ -L $2 ]]; then
        ln -sfv ${BASEDIR}/$1 $2
    else
        ln -sfvb ${BASEDIR}/$1 $2
    fi
}


safe_link bashrc ~/.bashrc
safe_link bash_aliases ~/.bash_aliases
safe_link vimrc ~/.vimrc
safe_link gitconfig ~/.gitconfig
safe_link gitignore ~/.gitignore

if hash nvim 2>/dev/null; then
  mkdir -p ~/.config/nvim
  safe_link vimrc ~/.config/nvim/init.vim
fi

if grep -q Microsoft /proc/version; then
  safe_link win_aliases ~/.win_aliases
fi

cd "${BASEDIR}"
git init
git remote add origin git@github.com:andreasmilch/dotfiles-minimal.git
git branch --set-upstream-to=origin/master master

# tmux
# safe_link ${BASEDIR}/tmux/.tmux.conf ~/.tmux.conf