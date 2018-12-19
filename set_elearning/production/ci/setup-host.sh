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


CHOICE=$(whiptail --title "Setup SET E-Learning plafroms" --menu "Where is your source code?" 16 100 9 \
	"1)" "GIT (https://gitlab.com/dootvmedia/tls-docker-projects.git)" \
	"2)" "Extract from backup file (i.e. www_31-01-2018-02h00m.tar.gz) ..." \
    "3)" "End"  3>&1 1>&2 2>&3)

case $CHOICE in
	"1)")   
        #clone docker-config from git repo
        mkdir -p /root/src
        mkdir -p /docker
        cd /root/src
        git clone https://gitlab.com/dootvmedia/tls-docker-projects.git
        cp -Rv /root/src/tls-docker-projects/set_elearning/production/set-web-v3 /docker/
	;;
	"2)")
        BACKUPFILE=$(whiptail --title "Extract from backup file" --inputbox "Where is your backup file? \n(i.e. /root/www_31-01-2018-02h00m.tar.gz)" 10 100 "./web.tar.gz" 3>&1 1>&2 2>&3)
        
        exitstatus=$?
        if [ $exitstatus = 0 ]; then
            if (whiptail --title "CONFIRM" --yesno "This will extract file $BACKUPFILE to /" 10 100) then
                echo "You chose Yes. Exit status was $?."
                #extract from backup file
                tar -xvf $BACKUPFILE -C /
            else
                echo "You chose No. Exit status was $?."
            fi
        else
            echo "You chose Cancel."
        fi
	;;
    "3)") exit
    ;;
esac





#clone project from repo
mkdir -p /data/www/elearning.set.or.th
mkdir -p /data/www/app-data
cd /data/www
git clone --depth=1 https://gitlab.com/dootvmedia-labs/elearning-set-or-th.git /data/www/elearning.set.or.th/


#prepare project directory
mkdir -p /docker
mkdir -p /data/www
mkdir -p /data/db-master

#build
cd /docker/set-web-v3
docker-compose -f /docker/set-web-v3/docker-compose.yml config
docker-compose -f /docker/set-web-v3/docker-compose.yml up -d
docker ps -a

#setup-container
cd /root/cli
docker cp setup-container.sh elearning-v3:/root/setup-container.sh
docker exec -ti elearning-v3 bash -c "/root/setup-container.sh"



