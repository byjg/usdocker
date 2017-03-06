#!/usr/bin/env bash

docker run -it --rm \
    -p 9001:9001 \
    -v `adjustLocalDirectories $PWD /opt/project` \
    -v `adjustLocalDirectories "$HOME/.composer" "$HOME/.composer"` \
    -v `adjustLocalDirectories "$HOME/.ssh" "$HOME/.ssh"`:ro \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v /tmp:/tmp \
    `linkContainer` ${EXTRA_PARAM} \
    byjg/php7:alpine sh

