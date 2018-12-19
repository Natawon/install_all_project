docker exec db-master mysql -uroot -pdootvazws3e -e "FLUSH TABLES WITH READ LOCK;SET GLOBAL read_only = ON; SET GLOBAL super_read_only = ON;" -vvv

docker exec db-slave 'mysql' -uroot -pdootvazws3e -e "STOP SLAVE;" -vvv
docker exec db-slave mysqldump -h db-master --port 3306 -uroot -pdootvazws3e --databases e_learning > dbdump.sql
docker exec db-slave 'mysql' -uroot -pdootvazws3e -e "SET GLOBAL read_only = OFF; SET GLOBAL super_read_only = OFF;" -vvv
docker exec -i db-slave mysql -uroot -pdootvazws3e < dbdump.sql

docker exec db-master mysql -uroot -pdootvazws3e -e "RESET MASTER;UNLOCK TABLES;SET GLOBAL read_only = OFF; SET GLOBAL super_read_only = OFF;" -vvv

docker exec db-slave 'mysql' -uroot -pdootvazws3e -e 'change master to master_host="db-master",master_port=3306,master_user="repl",master_password="replazws3e" ' -vvv
docker exec db-slave 'mysql' -uroot -pdootvazws3e -e "RESET SLAVE; START SLAVE;SET GLOBAL read_only = ON; SET GLOBAL super_read_only = ON;SHOW SLAVE STATUS\G" -vvv
