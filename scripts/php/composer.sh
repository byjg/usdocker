#!/usr/bin/env bash

source "$USD_SCRIPTS/php/setup.sh"

docker run -it --rm \
    -v `adjustLocalDirectories $PWD /opt/project` \
    -v `adjustLocalDirectories "$HOME/.composer" "$HOME/.composer"` \
    -v `adjustLocalDirectories "$HOME/.ssh" "$HOME/.ssh"`:ro \
    -w /opt/project \
    -u ${PHP_SHARE_USER}:${PHP_SHARE_GROUP} \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v /tmp:/tmp \
    -e TZ=${TZ} \
    byjg/php7:alpine composer "$@"

