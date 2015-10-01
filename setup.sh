#! /bin/bash

mkdir `pwd`/.vim
ln -s `pwd`/.vim $HOME/.vim
ln -s `pwd`/.vim $HOME/.nvim

curl -fLo `pwd`/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s `pwd`/vimrc $HOME/.vimrc
ln -s `pwd`/vimrc $HOME/.nvimrc

if hash nvim 2>/dev/null; then
    nvim -c "PlugInstall|wqa"
else
    vim -c "PlugInstall|wqa"
fi

ln -s `pwd`/tmux.conf $HOME/.tmux.conf
ln -s `pwd`/tmux-osx.conf $HOME/.tmux-osx.conf
ln -s `pwd`/ctags $HOME/.ctags
