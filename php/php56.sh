#!/usr/bin/env bash

docker run -it --rm \
    -p 9001:9001 \
    -v "$PWD":/opt/project \
    -v "$HOME/.composer:$HOME/.composer" \
    -w /opt/project -u $UID:${GROUPS[0]} \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v /tmp:/tmp \
    -e TZ=${TZ} \
    -v "$HOME/.ssh:$HOME/.ssh" \
    -v "$HOME/.keys:$HOME/.keys:ro" `linkContainer` ${EXTRA_PARAM} \
    byjg/php56:alpine php -d error_reporting=6143 "$@"

