#!/bin/bash
source _tool.sh

if [ "`which ruby`" == '' ]; then
  red "you have no ruby installed, install it first.";
  exit 1;
fi

if [ "`which gem`" == '' ]; then
  red "install gem first.";
  exit 1;
fi

aptInstall libbuilder-ruby;
aptInstall libxslt-dev;
aptInstall libxml2-dev;

gemInstall rails;
gemInstall mysql;
gemInstall passenger;

aptInstall libcurl4-openssl-dev

if [[ "`which apache2ctl`" == '' ]]; then
  aptInstall apache2
else
  white "apache2 has been installed, skip it."
fi

aptInstall apache2-prefork-dev

passenger-install-apache2-module

green "install rails ok! Please install imageMagick.";
