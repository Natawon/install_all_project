FROM alpine:edge

LABEL maintainer "Peerasan Buranasanti <peerasan@gmail.com>"

# Stable Repo
#RUN apk upgrade -U && apk --update --repository=http://dl-4.alpinelinux.org/alpine/edge/testing --repository=http://dl-4.alpinelinux.org/alpine/edge/main add \
RUN apk upgrade -U && apk add --no-cache php5-fpm && \
#RUN apk upgrade -U && apk add --no-cache php5 php5-fpm php5-json php5-mysqli php5-pdo_mysql php5-openssl php5-mcrypt php5-xml php5-curl && \
cp /etc/php5/php.ini /etc/php5/php.ini.orig && \
cp /etc/php5/php-fpm.conf /etc/php5/php-fpm.conf.orig && \
rm /var/cache/apk/* && \
mkdir /var/log/php5 && \
touch /var/log/php5/error.log && \
touch /var/log/php5/fpm-access.log && \
touch /var/log/php5/fpm-error.log && \
touch /var/log/php5/fpm-slow.log && \

# ensure www-data user exists
# 82 is the standard uid/gid for "www-data" in Alpine
set -x ; \
addgroup -g 82 -S www-data ; \
adduser -u 82 -D -S -G www-data www-data && exit 0 ; exit 1

# copy config files
COPY fs /

EXPOSE 9000
WORKDIR /var/www/html

CMD ["php-fpm5"]
#ENTRYPOINT ["/usr/bin/php-fpm5", "-F"]
