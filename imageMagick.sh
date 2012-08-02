#!/bin/bash
source _tool.sh

# remove system ImageMagick first
sudo apt-get remove imagemagick

# update and install dependencies
aptUpdate;
aptInstall libperl-dev;
aptInstall gcc;
aptInstall libjpeg62-dev;
aptInstall libbz2-dev;
aptInstall libtiff4-dev;
aptInstall libwmf-dev; 
aptInstall libz-dev;
aptInstall libpng12-dev;
aptInstall libx11-dev;
aptInstall libxt-dev; 
aptInstall libxext-dev;
aptInstall libxml2-dev; 
aptInstall libfreetype6-dev; 
aptInstall liblcms1-dev;
aptInstall libexif-dev; 
aptInstall perl;
aptInstall libjasper-dev; 
aptInstall libltdl3-dev; 
aptInstall graphviz; 
aptInstall ghostscript; 
aptInstall pkg-config;

# download ImageMagick source
wget ftp://ftp.imagemagick.org/pub/ImageMagick/ImageMagick.tar.gz
mkdir imageMagickTemp;
tar zxvf ImageMagick.tar.gz -C ./imageMagickTemp;
cd imageMagickTemp/ImageMagick-*;


# configure, make, make install, reload config
white "configure"
if ! ./configure; then
  red "install ImageMagick failed: ./configure"
  exit 1;
fi

white "make"
if ! make; then
  red "install ImageMagick failed: make"
  exit 1;
fi

white "sudo make install"
if ! sudo make install; then
  red "install ImageMagick failed: sudo make install"
  exit 1;
fi
sudo ldconfig /usr/local/lib/


# install gem
gemInstall rmagick;

# remove temp source file
cd ../..
rm -rf imageMagickTemp;
rm ImageMagick.tar.gz;


green "install ImageMagick ok"
