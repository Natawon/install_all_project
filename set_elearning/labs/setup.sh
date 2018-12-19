docker exec db-master 'mysql' -uroot -pdootvazws3e -e "GRANT REPLICATION SLAVE ON *.* TO repl@'%' IDENTIFIED BY 'replazws3e'" -vvv
docker exec db-master 'mysql' -uroot -pdootvazws3e -e "CREATE USER 'setlive'@'localhost' IDENTIFIED BY 'set1qwsdc';  GRANT ALL PRIVILEGES ON setlive.* TO 'setlive'@'localhost';" -vvv
docker exec db-slave 'mysql' -uroot -pdootvazws3e -e "CREATE USER 'setlive'@'localhost' IDENTIFIED BY 'set1qwsdc';  GRANT SELECT ON setlive.* TO 'setlive'@'localhost';" -vvv

docker exec web1 bash -c '/etc/init.d/php7.0-fpm start'
docker exec web2 bash -c '/etc/init.d/php7.0-fpm start'

docker exec haproxy-certbot certbot-certonly --domain origin1.open-cdn.com --email server@dootvmedia.com --standalone
docker exec haproxy-certbot haproxy-refresh

