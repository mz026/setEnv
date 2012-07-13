#!/bin/bash
source _tool.sh

white "now cloning gitconfig repository...";
git clone git://github.com/mz026/gitconfig.git ~/.gitconfigRepo;
green "cloned gitconfig to .gitconfigRepo !";

ln -s ~/.gitconfigRepo/.gitconfig ~/.gitconfig
green "made a symbolic link ~/.gitconfig to ~/.gitconfigRepo/.gitconfig";
