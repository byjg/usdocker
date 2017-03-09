FROM byjg/nginx-extras:1.10

ARG TZ

RUN rm /etc/nginx/sites-enabled/*

COPY conf.d /etc/nginx/sites-enabled

ENV TZ=$TZ



