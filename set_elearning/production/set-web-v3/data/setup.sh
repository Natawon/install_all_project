docker exec db-master 'mysql' -uroot -pdootvazws3e -e "GRANT REPLICATION SLAVE ON *.* TO repl@'%' IDENTIFIED BY 'replazws3e'" -vvv
docker exec db-master 'mysql' -uroot -pdootvazws3e -e "CREATE USER 'setlive'@'localhost' IDENTIFIED BY 'set1qwsdc';  GRANT ALL PRIVILEGES ON setlive.* TO 'setlive'@'localhost';" -vvv

docker exec elearning-v2 bash -c '/etc/init.d/php7.1-fpm start'

#docker exec haproxy-certbot certbot-certonly --domain set-labs.open-cdn.com --email server@dootvmedia.com --standalone
#docker exec haproxy-certbot haproxy-refresh

