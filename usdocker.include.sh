#!/bin/bash

strindex() {
  x="${1%%$2*}"
  [[ $x = $1 ]] && echo -1 || echo ${#x}
}

linkContainerParameter() {
    RESULT=""
    while [ ! -z "$1" ]
    do
        RESULT=" --link $1:$1 $RESULT"
        shift
    done

    echo $RESULT
}

linkContainer() {
    HEAD=`docker ps | head -n 1`
    COLUMN=`strindex "$HEAD" "NAMES"`
    linkContainerParameter `docker ps  | cut -c $((COLUMN + 1))- | tail -n +2`
}

getLocalTimeZone() {
    if [ -f /etc/timezone ]; then
      LOCALTZ=`cat /etc/timezone`
    elif [ -h /etc/localtime ]; then
      LOCALTZ=`readlink /etc/localtime | sed "s/\/usr\/share\/zoneinfo\///"`
    else
      checksum=`md5sum /etc/localtime | cut -d' ' -f1`
      LOCALTZ=`find /usr/share/zoneinfo/ -type f -exec md5sum {} \; | grep "^$checksum" | sed "s/.*\/usr\/share\/zoneinfo\///" | head -n 1`
    fi
    echo ${LOCALTZ}
}

setupEnvironment() {
    FILE="$USD_HOME/$1"

    mkdir -p `dirname $FILE`
    touch "$FILE"

    if ! grep -q "$2=" "$FILE"; then
        echo "$2=$3" >> "$FILE"
    fi
}
