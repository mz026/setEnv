#!/bin/bash
source _tool.sh

cd ~/.vimrcRepo;
if [[ `git remote` != *github* ]]; then
  git remote add github git@github.com:mz026/vimrc.git
fi

execute "git checkout master";
execute "git pull github master";
if [[ `git diff` != '' ]]; then
  execute "git add .";
  execute "git commit -m ''";
  execute "git push github master";
fi
