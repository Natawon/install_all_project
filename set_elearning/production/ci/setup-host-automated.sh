#!/bin/bash

#prepare OS
apt-get -y update && apt-get -y autoremove && apt-get -y dist-upgrade


# #install docker
apt-get -y install apt-transport-https  ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update
apt-get -y  install docker-ce
docker -v

# #install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
docker-compose --version

#prepare project directory
mkdir -p /docker
mkdir -p /data/www
mkdir -p /data/db-master

#clone docker-config from git repo
mkdir -p /root/src
mkdir -p /docker
cd /root/src
git clone https://gitlab.com/dootvmedia/tls-docker-projects.git
cp -Rv /root/src/tls-docker-projects/set_elearning/production/set-web-v3 /docker/

#extract from backup file
cd /root/cli
tar -xvf ./web.tar.gz -C /

#build
cd /docker/set-web-v3
docker-compose -f /docker/set-web-v3/docker-compose.yml config
docker-compose -f /docker/set-web-v3/docker-compose.yml up -d
docker ps -a

#setup-container
cd /root/cli
docker cp setup-container.sh elearning-v3:/root/setup-container.sh
docker exec -ti elearning-v3 bash -c "/root/setup-container.sh"



