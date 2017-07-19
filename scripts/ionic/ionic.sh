#!/usr/bin/env bash


# https://hub.docker.com/r/marcoturi/ionic/

docker run -it --rm \
    -p 8100:8100 \
    -p 35729:35729 \
    --privileged \
    -v /dev/bus/usb:/dev/bus/usb \
    -v ~/.gradle:/root/.gradle \
    -v \$PWD:/Sources:rw \
    -v ~/.gitconfig:/root/.gitconfig:ro \
    marcoturi/ionic ionic


docker run -it --rm \
    -p 8100:8100 \
    -p 35729:35729 \
    --privileged \
    -v /dev/bus/usb:/dev/bus/usb \
    -v ~/.gradle:/root/.gradle \
    -v /tmp/.android:/root/.android \
    -v $PWD:/Sources:rw \
    -v ~/.gitconfig:/root/.gitconfig:ro \
    marcoturi/ionic adb devices

docker run -it --rm \
    -p 8100:8100 \
    -p 35729:35729 \
    --privileged \
    -v /dev/bus/usb:/dev/bus/usb \
    -v ~/.gradle:/root/.gradle \
    -v /tmp/.android:/root/.android \
    -v $PWD:/Sources:rw \
    -v ~/.gitconfig:/root/.gitconfig:ro \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -e DISPLAY \
    --device /dev/dri \
    -v $(dirname $SSH_AUTH_SOCK):$(dirname $SSH_AUTH_SOCK) \
    marcoturi/ionic android
