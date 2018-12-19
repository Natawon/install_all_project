docker exec db-slave 'mysql' -uroot -pdootvazws3e -e "CREATE USER 'setlive'@'localhost' IDENTIFIED BY 'set1qwsdc';  GRANT SELECT ON setlive.* TO 'setlive'@'localhost';" -vvv
docker exec web2 bash -c '/etc/init.d/php7.0-fpm start'


