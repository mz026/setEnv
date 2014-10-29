#!/bin/bash

source _tool.sh

aptUpdate;

white "now installing rvm with ruby...";
curl -sSL https://get.rvm.io | bash -s stable --ruby

echo "[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm" >> ~/.bashrc
source ~/.bashrc
