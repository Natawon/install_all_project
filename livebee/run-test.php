<?php
#CONFIG
$port_start = 5000;
$current_dir = getcwd();
$test_count = 1;

################################################################################################################

#stop and remove container
$PWD = getcwd(); // current working directory
//echo exec('docker stop $(docker ps -a -q)');
//echo exec('docker rm $(docker ps -a -q)');



for ($i=1; $i <= 100; $i++){
    $port = $port_start + $i;
    echo "STOP demo_$port"; system ("docker stop demo_$port") . "\n";
    echo "REMOVE demo_$port"; system ("docker rm demo_$port") . "\n";
}


/*
#sample
docker run -t --name demo_8001 -p 8001:80 -h lemp -d demo-master:latest
docker cp F:\GIT\alpine-lemp/apps.zip demo_8001:/
docker cp F:\GIT\alpine-lemp/etc/ demo_8001:/etc
docker exec -ti demo_8001 unzip -o /apps.zip
docker exec demo_8001 nginx -s reload
*/

//echo exec("docker run --name database -e MYSQL_ROOT_PASSWORD=mysql -v $PWD/data/database:/var/lib/mysql -d mysql");
////echo exec("docker run --name php5-fpm --link database:mysql --expose 9000 -v $PWD/data/apps:/apps -d alpine-php5");
//echo exec("docker run --name php5-fpm --link database:mysql --expose 9000 -v $PWD/data/apps:/apps -d dootvmedia/alpine-php:php5");


#setup run container
for ($i=1; $i <= $test_count; $i++){
    $port = $port_start + $i;
    $server_name = "demo_$port";
    //$cmd = "docker run -t --name demo_$port -p $port:80 -v ". $current_dir ."/apps:/apps -v ". $current_dir."/etc/nginx/conf.d:/etc/nginx/conf.d  -h lemp -d demo-master:latest";
    echo "-------------------------------------------------------------------------\n";
    $cmd = "docker run --name $server_name --link php5-fpm:php -p $port:80 -v $PWD/etc/nginx/conf.d:/etc/nginx/conf.d -v $PWD/data/apps_$port:/apps -d nginx:mainline-alpine";
    echo $cmd;echo exec($cmd) . "\r\n";

    $cmd = "docker cp ". $PWD ."/apps.zip ". $server_name .":/";
    echo $cmd;echo exec($cmd) . "\r\n";
    
    #$cmd = "docker cp ". $PWD ."/etc/ ". $server_name .":/etc";
    #echo $cmd;echo exec($cmd) . "\n";
    $cmd = "docker exec $server_name unzip -o /apps.zip";
    echo $cmd;echo exec($cmd) . "\r\n";

    $cmd = "docker exec $server_name nginx -s reload";
    echo $cmd;echo exec($cmd) . "\r\n"; 
}
?>
