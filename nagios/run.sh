#/bin/bash

docker stop nagios4;
docker rm nagios4;


# docker run --name nagios4  \
#   -v $PWD/config/nagios_client/etc/:/opt/nagios/etc/ \
#   -v $PWD/config/nagios_client/var:/opt/nagios/var/ \
#   -v $PWD/config/nagios_client/Custom-Nagios-Plugins:/opt/Custom-Nagios-Plugins \
#   -p 8080:80 jasonrivers/nagios:latest



docker run --name nagios4  \
  -e TZ=Asia/Bangkok \
  -e NAGIOS_TIMEZONE=Asia/Bangkok \
  -e NAGIOSADMIN_USER=nagiosadmin \
  -e NAGIOSADMIN_PASS=qawsedrf@TH@ \
  -h nagios_monitor \
  -v $PWD/config/nagios_client/etc/:/opt/nagios/etc/  \
  -v $PWD/config/nagios_client/Custom-Nagios-Plugins:/opt/Custom-Nagios-Plugins \
  -p 8080:80 -d jasonrivers/nagios:latest

#setup relate package
#sleep 10;
docker exec nagios4 bash -c "apt update; apt install -y nano php7.0-curl"
docker exec nagios4 bash -c "rm /etc/localtime; ln -s /usr/share/zoneinfo/Asia/Bangkok /etc/localtime"
docker exec nagios4 bash -c "echo 'date.timezone = Asia/Bangkok' >> /etc/php/7.0/apache2/php.ini"

