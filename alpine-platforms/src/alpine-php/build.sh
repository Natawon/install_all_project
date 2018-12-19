#!/bin/bash

docker stop $(docker ps -a -q); docker rm $(docker ps -a -q)
docker stop alpine-php5
docker rm alpine-php5
docker rmi alpine-php5
docker build -t alpine-php5 .
docker run --name alpine-php5 -d alpine-php5
#docker exec -ti alpine-php5 sh
