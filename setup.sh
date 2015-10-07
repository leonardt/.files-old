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

ln -s `pwd`/zshrc $HOME/.zshrc

git clone --depth 1 https://github.com/junegunn/fzf.git `pwd`/.fzf
`pwd`/.fzf/install

git clone https://github.com/tarjoilija/zgen.git `pwd`/zgen

curl http://beyondgrep.com/ack-2.14-single-file > `pwd`/bin/ack && chmod 0755 `pwd`/bin/ack
