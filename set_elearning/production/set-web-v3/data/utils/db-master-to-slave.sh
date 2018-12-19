#MASTER: th-live-15.open-cdn.com

sshpass -p 'vrthebest' ssh root@th-live-15.open-cdn.com 'docker exec db-master mysql -uroot -ppasswd -e "FLUSH TABLES WITH READ LOCK;SET GLOBAL read_only = ON; SET GLOBAL super_read_only = ON;" -vvv'

docker exec db-slave 'mysql' -uroot -ppasswd -e "STOP SLAVE;" -vvv
docker exec db-slave mysqldump -h th-live-15.open-cdn.com -uroot -ppasswd --databases patdb > dbdump.db
docker exec db-slave 'mysql' -uroot -ppasswd -e "SET GLOBAL read_only = OFF; SET GLOBAL super_read_only = OFF;" -vvv
docker exec -i db-slave mysql -uroot -ppasswd < dbdump.db

sshpass -p 'vrthebest' ssh root@th-live-15.open-cdn.com 'docker exec db-master mysql -uroot -ppasswd -e "RESET MASTER;UNLOCK TABLES;SET GLOBAL read_only = OFF; SET GLOBAL super_read_only = OFF;" -vvv'

docker exec db-slave 'mysql' -uroot -ppasswd -e 'change master to master_host="th-live-15.open-cdn.com",master_user="repl",master_password="replazws3e" ' -vvv
docker exec db-slave 'mysql' -uroot -ppasswd -e "RESET SLAVE; START SLAVE;SET GLOBAL read_only = ON; SET GLOBAL super_read_only = ON;SHOW SLAVE STATUS\G" -vvv
