#!/usr/bin/env bash

# Define REAL PATH
if [ -x "`which realpath`" ]
then
    USD_DIR=`realpath $0`
    USD_DIR=`dirname $USD_DIR`
else
    USD_DIR="$(dirname "$(readlink -f "$0")")"
fi

if [ ! -f "$USD_DIR/usdocker.sh" ]
then
    echo "Cannot detect realpath :("
    exit
fi

USD_INCLUDE="$USD_DIR/include"
USD_SCRIPTS="$USD_DIR/scripts"

source "$USD_INCLUDE/usdocker.include.sh"

USD_HOME="${HOME}/.usdocker"
mkdir -p "$USD_HOME"

USD_DATA="${HOME}/.usdocker_data"
mkdir -p "$USD_HOME"


setupEnvironment environment TZ `getLocalTimeZone`
setupEnvironment environment CONTAINER_NAME_SUFFIX -container
setupEnvironment environment LOCAL_HOME /home/
setupEnvironment environment REMOTE_HOST_SHARE /hosthome/
source "$USD_HOME/environment"

if [ -z "$1" ]
then
    echo You need to pass the useful script service you want:
    echo
    echo Available:
    find "${USD_SCRIPTS}/." -maxdepth 1  ! -name '.*' -type d -exec basename "{}" \; | sort
    echo
    exit 1
fi

USD_SERVICE="$1"

if [ ! -d "$USD_SCRIPTS/$USD_SERVICE" ]
then
    echo "Useful Script Service '$USD_SERVICE' does not exists"
    echo
    exit 1
fi
shift

if [ -z "$1" ]
then
    echo Available usefull script:
    find "${USD_SCRIPTS}/$USD_SERVICE/." -maxdepth 1  ! -name '.*' -name '*.sh' -type f -exec basename "{}" \; | sort | cut -d'.' -f1
    echo
    cat "${USD_SCRIPTS}/$USD_SERVICE/README.md"
    echo
    exit 1
fi

USD_SCRIPT="$1"
shift

source "${USD_SCRIPTS}/${USD_SERVICE}/${USD_SCRIPT}.sh"
