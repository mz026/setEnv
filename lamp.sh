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
aptInstall php-pear;
aptInstall git-core;

white "now discovering pear channels..."
sudo pear upgrade pear
sudo pear channel-discover pear.phpunit.de
sudo pear channel-discover pear.symfony-project.com
sudo pear channel-discover components.ez.no
sudo pear update-channels
sudo pear upgrade-all

white "installing phpunit ..."
sudo pear install --alldeps phpunit/PHPUnit

white "installing phpunit_selenium ..."
sudo pear install phpunit/phpunit_selenium

green "ya!";
