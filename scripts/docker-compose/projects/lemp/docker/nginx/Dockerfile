FROM byjg/nginx-extras:1.10

RUN rm /etc/nginx/sites-enabled/*

COPY conf.d /etc/nginx/sites-enabled

# Setup DateFile
RUN apt-get update && apt-get install -y tzdata && apt-get clean -y
ENV TZ=America/Sao_Paulo

EXPOSE 80




