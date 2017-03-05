#!/bin/bash

docker run -it --rm \
    -v "$PWD":/opt/project \
    -v "$HOME/.composer:$HOME/.composer" \
    -w /opt/project -u $UID:${GROUPS[0]} \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v "$HOME/.ssh:$HOME/.ssh" \
    -v "$HOME/.keys:$HOME/.keys:ro" \
    -e TZ=${TZ} \
    byjg/php7:alpine phpmd "$@"

