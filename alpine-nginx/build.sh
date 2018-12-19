#!/bin/bash
docker-compose -f docker-compose.yml down
mkdir ./data/www;
mkdir ./data/log;
echo '<?php phpinfo();?>' > ./data/www/phpinfo.php
docker-compose -f docker-compose.yml up -d 
