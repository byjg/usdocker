#!/usr/bin/env bash

docker run -it --rm \
    -v `adjustLocalDirectories $PWD /opt/project` \
    -v `adjustLocalDirectories "$HOME/.composer" "$HOME/.composer"` \
    -v `adjustLocalDirectories "$HOME/.ssh" "$HOME/.ssh"`:ro \
    -w /opt/project \
    -u $UID:${GROUPS[0]} \
    -v /etc/passwd:/etc/passwd:ro \
    -v /etc/group:/etc/group:ro \
    -e TZ=${TZ} \
    byjg/php7:alpine phpcs "$@"

