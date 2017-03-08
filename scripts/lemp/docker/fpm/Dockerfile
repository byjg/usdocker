FROM byjg/php7-fpm:alpine

VOLUME /srv/web
WORKDIR /srv/web

# Setup Docker/Fpm
COPY ./php /usr/local/etc/php/conf.d
COPY ./fpmpool /usr/local/etc/php-fpm.d

ENV TZ=$TZ