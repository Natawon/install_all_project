#!/bin/bash

#run these containner in container
apt-get -y update && apt-get -y autoremove && apt-get -y dist-upgrade
apt-get -y install ghostscript postfix

service postfix start

#install composer
mkdir /root/src
cd /root/src/
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer
composer -V


cd /usr/share/nginx/html/elearning.set.or.th/api
composer install
