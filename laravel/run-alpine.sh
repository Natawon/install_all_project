docker stop laravel_alpine
docker rm laravel_alpine
docker run --name laravel_alpine -v $PWD/www:/apps -p 81:80 -h lemp -d dootvmedia/alpine:nginx-php7
docker exec -ti laravel_alpine sh
