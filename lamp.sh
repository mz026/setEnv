#!/bin/bash
source _tool.sh

aptUpdate;
aptInstall curl;
aptInstall apache2;
aptInstall mysql-client;
aptInstall mysql-server;
aptInstall php5;
aptInstall libapache2-mod-php5;
aptInstall libapache2-mod-auth-mysql;
aptInstall php5-xdebug;
aptInstall php5-mysql;
aptInstall php5-gd;
aptInstall php5-cli;
aptInstall php5-curl;
aptInstall php5-tidy;
aptInstall php5-mcrypt;
aptInstall php-pear;
aptInstall git-core;
aptInstall phpmyadmin;

green "ya!";

