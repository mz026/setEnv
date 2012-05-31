#!/bin/bash
source _tool.sh

white "now start to clone vundle...";
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
green "cloned vundle!";

white "now start to clone vimrc...";
git clone git://github.com/mz026/vimrc.git ~/.vimrcRepo
green "cloned vimrc into ~/.vimrcRepo!";


ln ~/.vimrcRepo/.vimrc .vimrc
green "link ~/.vimrc to ~/.vimrcRepo/.vimrc"
