#!/bin/bash

docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)

docker run --name database -p 3306:3306 --env "MYSQL_ROOT_PASSWORD=mysql" -v $PWD/data/database:/var/lib/mysql -d mysql
docker run --name demo-1 --link database:mysql -p 80:80 -v $PWD/config/etc/nginx/conf.d:/etc/nginx/conf.d -v $PWD/config/etc/php5:/etc/php5 -v /data/www:/apps -d dootvmedia/alpine:nginx-php5

docker ps -a
