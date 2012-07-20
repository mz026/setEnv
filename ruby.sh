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

white "now intalling libreadline5-dev..."
if sudo apt-get install libreadline5-dev; then
  green "install libreadline5-dev ok."
else
  white "install libreadline5-dev failed, now try libreadline-gplv2-dev"
  aptInstall libreadline-gplv2-dev;
fi

white "now installing rvm...";
curl -L get.rvm.io | bash -s stable
echo "[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm" >> ~/.bashrc
source ~/.bashrc

if rvm install 1.9.3; then
  white 'execute "source ~/.bashrc to finish the installation."'
  green "install ruby 1.9.3 ok.";
else
  red "install ruby 1.9.3 failed."
  exit 1;
fi




