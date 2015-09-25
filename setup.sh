#! /bin/bash

mkdir `pwd`/.vim
ln -s `pwd`/.vim $HOME/.vim
ln -s `pwd`/.vim $HOME/.nvim

curl -fLo `pwd`/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s `pwd`/.files/vimrc $HOME/.vimrc
ln -s `pwd`/.files/vimrc $HOME/.nvimrc

if hash nvim 2>/dev/null; then
    nvim -c "PlugInstall|wqa"
else
    vim -c "PlugInstall|wqa"
fi
