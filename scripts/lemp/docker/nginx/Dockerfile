FROM nginx:1.11

ARG TZ

RUN rm /etc/nginx/conf.d/*

COPY conf.d /etc/nginx/conf.d

ENV TZ=$TZ



