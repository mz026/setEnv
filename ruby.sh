#!/bin/bash

source _tool.sh

aptUpdate;
aptInstall git-core;
aptInstall mysql-server;
aptInstall curl;
aptInstall libmysqlclient15-dev;
aptInstall build-essential;
aptInstall zlib1g-dev;
aptInstall libssl-dev;
aptInstall libreadline-gplv2-dev;

white "now installing rvm...";
curl -L get.rvm.io | bash -s stable
echo "[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm" >> ~/.bash_profile
source ~/.bash_profile

if rvm install 1.9.3; then
  white 'execute "source ~/.profile to finish the installation."'
  green "install ruby 1.9.3 ok.";
else
  red "install ruby 1.9.3 failed."
  exit 1;
fi




