#!/bin/bash

docker stop $(docker ps -a -q); docker rm $(docker ps -a -q);

docker run --name database -p 3306:3306 -e MYSQL_ROOT_PASSWORD=mysql -v F:\GIT\tls-docker-projects\alpine-platforms\data\database:/var/lib/mysql -d mysql
docker run --name demo-1 --link database:mysql -p 8001:80 -v F:\GIT\tls-docker-projects\alpine-platforms\config\etc\nginx\conf.d:/etc/nginx/conf.d -v F:\GIT\tls-docker-projects\alpine-platforms\config\etc\php5:/etc/php5 -v F:\GIT\tls-docker-projects\alpine-platforms\data\apps:/apps -d dootvmedia/alpine:nginx-php5

docker ps -a
