#!/usr/bin/env bash

docker run -it --rm \
    -p 9001:9001 \
    -v `adjustLocalDirectories $PWD /opt/project` \
    -v `adjustLocalDirectories "$HOME/.composer" "$HOME/.composer"` \
    -v `adjustLocalDirectories "$HOME/.ssh" "$HOME/.ssh"`:ro \
    -w /opt/project \
    -u $UID:${GROUPS[0]} \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v /tmp:/tmp \
    -e TZ=${TZ} \
    `linkContainer` ${EXTRA_PARAM} \
    byjg/php56:alpine php -d error_reporting=6143 "$@"
