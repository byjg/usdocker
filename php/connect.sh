#!/usr/bin/env bash

docker run -it --rm \
    -p 9001:9001 \
    -v "$PWD":/opt/project \
    -w /opt/project -u $UID:${GROUPS[0]} \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v /tmp:/tmp \
    -v "$HOME/.ssh:$HOME/.ssh" \
    -v "$HOME/.keys:$HOME/.keys:ro" `linkContainer` ${EXTRA_PARAM} \
    byjg/php7:alpine sh

