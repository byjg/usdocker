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

    KEY="${USD_SERVICE^^}_${2^^}"
    KEY="${KEY//-/_}"
    if [ "${KEY:0:1}" == "_" ]; then
        KEY="${KEY:1}"
    fi

    if ! grep -q "${KEY}=" "$FILE"; then
        echo "${KEY}=$3" >> "$FILE"
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

checkDockerInstalled() {
    if ! hash docker 2>/dev/null; then
        echo "Docker was not installed. Press ENTER to install or CTRL+C for abort"
        read
        echo "Using 'sudo' for install docker"
        sudo usdocker docker install
        exit
    fi
}

checkDependency() {
    RESULT=`docker ps  | grep -c $1${CONTAINER_NAME_SUFFIX}`

    if [ "$RESULT" == "0" ]
    then
        echo "This script requires '$1'. Press CTRL+C for abort or ENTER to start '$1' and continue"
        read
        usdocker $1 up
    fi
}

dockerMachineWarning() {
    if [ ! -z "$DOCKER_HOST" ]
    then
        echo "It seems docker-machine is active and direct to '$DOCKER_HOST'"
        echo "It is important to note this script is not fully functional in a docker machine environment"
        echo
        echo "Press ENTER to continue or CTRL+C to abort"
        echo
    fi
}

dockerStatus() {
    ST1=`docker ps | grep -c $1${CONTAINER_NAME_SUFFIX}`
    ST2=`docker ps -a | grep -c $1${CONTAINER_NAME_SUFFIX}`

    if [ "$ST1" == "1" ]
    then
        echo "$1 is up"
        return
    fi

    if [ "$ST2" == "1" ]
    then
        echo "$1 is stopped"
        return
    fi

    echo "$1 is down"
}

dockerConnect() {
    source "$USD_SCRIPTS/$1/setup.sh"
    docker exec -it $1${CONTAINER_NAME_SUFFIX} bash
}

dockerDown() {
    dockerMachineWarning

    source "$USD_SCRIPTS/$1/setup.sh"

    docker stop $1${CONTAINER_NAME_SUFFIX}
    docker rm $1${CONTAINER_NAME_SUFFIX}
}

dockerRestart() {
    source "$USD_SCRIPTS/$1/down.sh"
    source "$USD_SCRIPTS/$1/up.sh"
}

resetQuestion() {
    if [ "$1" == "--reset" ] || [ "$1" == "--reset-env" ] || [ "$1" == "--reset-data" ]
    then

        if [ "$USD_SERVICE is down" != "`dockerStatus $USD_SERVICE`" ]
        then
            echo "You cannot reset while the service is running"
            exit 1
        fi

        printf "Do you really reset "
        if [ "$1" == "--reset" ]; then
            printf "ALL USER DATA AND CONFIG"
        fi

        if [ "$1" == "--reset-env" ]; then
            printf "ALL USER CONFIG"
        fi

        if [ "$1" == "--reset-data" ]; then
            printf "ALL USER DATA"
        fi

        printf "?. Press ENTER to continue or CTRL+C to cancel"
        read
    fi

}

resetData() {
    if [ "$1" == "--reset" ] || [ "$1" == "--reset-data" ]
    then
        rm -rf $2
    fi
}

resetEnvironment() {
    if [ "$1" == "--reset" ] || [ "$1" == "--reset-env" ]
    then
        rm -rf ${USD_HOME}/${USD_SERVICE}
    fi
}

resetFinsih() {
    if [ "$1" == "--reset" ] || [ "$1" == "--reset-env" ] || [ "$1" == "--reset-data" ]
    then
        echo Done.
        exit
    fi
}

setKeyValue() {
    if [ "$1" == "--set" ]
    then
        if [ -z "$2" ] || [ -z "$3" ]
        then
            echo "You need pass the KEY and VALUE to be setup"
        fi
        KEY="${2^^}"
        VALUE="$3"
        sed -i'' -e "s%^$KEY=.*$%$KEY=$VALUE%g" "${USD_HOME}/${USD_SERVICE}/environment"
        exit
    fi
}

printGlobalEnvironment() {
    echo USD_INCLUDE="$USD_INCLUDE"
    echo USD_SCRIPTS="$USD_SCRIPTS"
    echo USD_DOCS="$USD_DOCS"
    echo USD_HOME="$USD_HOME"
    echo USD_DATA="$USD_DATA"
    cat "$USD_HOME/environment"
}

printServiceEnvironment() {
    printGlobalEnvironment
    if [ -f "$USD_SCRIPTS/$USD_SERVICE/setup.sh" ]; then
        source "$USD_SCRIPTS/$USD_SERVICE/setup.sh"
    fi

    if [ -f "$USD_HOME/$USD_SERVICE/environment" ]; then 
        cat "$USD_HOME/$USD_SERVICE/environment"
    fi
}

showHeader() {
    if [ -d .git ]; then
        BRANCH=$(cat .git/HEAD | cut -d/  -f 3)
        HASH=$(cat .git/`cat .git/HEAD | cut -d \  -f 2` | cut -c1-7)
        VERSION="($BRANCH@$HASH)"
    fi
    if [ -f .version ]; then
        VERSION="$(cat .version) $VERSION"
    fi
    echo
    echo USDocker $VERSION
    echo
}
