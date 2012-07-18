#!/bin/bash
source _tool.sh

sudo apt-get remove imagemagick
aptInstall libperl-dev;
aptInstall gcc;
aptInstall libjpeg62-dev;
aptInstall libbz2-dev;
aptInstall libtiff4-dev;
aptInstall libwmf-dev; 
aptInstall libz-dev;

wget ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick.tar.gz
mkdir imageMagickTemp;
tar zxvf ImageMagick.tar.gz -C ./imageMagickTemp;
cd imageMagickTemp/ImageMagick-*;
if ! ./configure && make && sudo make install; then
  red "install ImageMagick failed."
  exit 1;
fi

gemInstall rmagick;

cd ../..
rm -rf imageMagickTemp;
rm ImageMagick.tar.gz;
