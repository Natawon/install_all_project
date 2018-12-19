#!/bin/bash
docker-compose -f docker-compose.yml down
mkdir ./data/db-master; rm -rf ./data/db-master/*;
mkdir ./data/www;
echo '<?php phpinfo();?>' > ./data/www/index.php
docker-compose -f docker-compose.yml up -d 
