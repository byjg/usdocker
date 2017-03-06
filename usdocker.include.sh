#!/usr/bin/env bash

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

adjustLocalDirectories() {
    if [ -z "$DOCKER_MACHINE_NAME" ]
    then
        echo "$1:$2"
        return
    fi

    ORIGINAL="$1"
    SEARCH="$LOCAL_HOME"
    REPLACE="$REMOTE_HOST_SHARE"

    echo "${ORIGINAL/$SEARCH/$REPLACE}:$2"
}

checkIsRunning() {
    sleep 2
    RESULT=`docker ps  | grep -c $1`

    if [ "$RESULT" == "0" ]
    then
        docker logs $1
        docker rm $1
    fi
}

dockerMachineWarning()
{
    if [ ! -z "$DOCKER_HOST" ]
    then
        echo "It seems docker-machine is active and direct to '$DOCKER_HOST'"
        echo "It is important to note this script is not fully functional in a docker machine environment"
        echo
        echo "Press ENTER to continue or CTRL+C to abort"
        echo
    fi
}