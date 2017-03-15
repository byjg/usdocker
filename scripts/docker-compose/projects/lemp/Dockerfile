FROM byjg/php7-fpm:alpine

VOLUME /srv/web
WORKDIR /srv/web

# Setup Docker/Fpm
COPY ./docker/fpm/php /usr/local/etc/php/conf.d

# Setup Web Site
#COPY FOLDER /srv/web/

## SETUP CRONTAB
#COPY ./docker/fpm/cron/crontab /etc/crontabs/root
#COPY ./docker/fpm/cron/docker-php-entrypoint-replacement /usr/local/bin/docker-php-entrypoint

# Setup DateFile
RUN apk add --no-cache --update tzdata
ENV TZ=America/Sao_Paulo

#RUN composer update


