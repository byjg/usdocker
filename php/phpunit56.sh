#!/usr/bin/env bash

docker run -it --rm \
    -v `adjustLocalDirectories $PWD /opt/project` \
    -v `adjustLocalDirectories "$HOME/.composer" "$HOME/.composer"` \
    -v `adjustLocalDirectories "$HOME/.ssh" "$HOME/.ssh"`:ro \
    -w /opt/project \
    -u $UID:${GROUPS[0]} \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -v /tmp:/tmp \
    `linkContainer` \
    -e TZ=${TZ} \
    byjg/php56:alpine phpunit -d error_reporting=6143 "$@"

