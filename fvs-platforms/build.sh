#!/bin/bash

#docker stop $(docker ps -a -q)
#docker rm $(docker ps -a -q)

#docker run --name database -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mysql -v $PWD/data/database:/var/lib/mysql -d mysql
#docker run --name demo-1 --link database:mysql -p 8001:80 -v /raid:/raid  -v $PWD/config/etc/nginx/conf.d:/etc/nginx/conf.d -v $PWD/config/etc/php5:/etc/php5 -v /data/www:/apps -d dootvmedia/alpine:nginx-php5

docker stop demo-2; docker rm demo-2;
#docker run --name demo-2 --link database:mysql -p 8002:80 -v /raid:/raid  -v $PWD/config/etc/nginx/conf.d:/etc/nginx/conf.d -v $PWD/config/etc/php7:/etc/php7 -v /data/www:/apps -d dootvmedia/alpine:nginx-php7
docker run --name demo-2  --link database:mysql -p 8002:80 -v /raid:/raid  -v $PWD/config/etc/nginx/conf.d:/etc/nginx/conf.d -v $PWD/config/etc/php7/php.ini:/etc/php7/php.ini -v $PWD/config/etc/php7/php-fpm.conf:/etc/php7/php-fpm.conf -v /data/www:/apps -d dootvmedia/alpine:nginx-php7

docker ps -a
