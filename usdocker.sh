#!/usr/bin/env bash

# Define REAL PATH
if hash realpath 2>/dev/null; then
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
USD_DOCS="$USD_DIR/docs"

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
    showHeader
    echo "Usage:"
    echo " - usdocker <script> <command> [args]"
    echo
    echo "Where <scripts> are:"
    find "${USD_SCRIPTS}/." -maxdepth 1  ! -name '.*' -type d -exec basename "{}" \; | sort | sed -e 's/^/ - /'
    echo " - self-update"
    echo
    exit 1
fi

if [ "$1" == "env" ]
then
    printGlobalEnvironment
    exit
fi

if [ "$1" == "self-update" ]
then
    if [[ $EUID -ne 0 ]]; then
       echo "This script must be run as root" 1>&2
       exit 1
    fi

    cd $USD_DIR
    git pull
    exit
fi

USD_SERVICE="$1"
USD_LABEL="${1^^}"

if [ ! -d "$USD_SCRIPTS/$USD_SERVICE" ]
then
    showHeader
    echo "Useful Script Service '$USD_SERVICE' does not exists"
    echo
    exit 1
fi
shift

if [ -z "$1" ]
then
    showHeader
    echo Usage:
    echo " - usdocker $USD_SERVICE <command>"
    echo
    echo "The commands available for $USD_SERVICE service are:"
    find "${USD_SCRIPTS}/$USD_SERVICE/." -maxdepth 1  ! -name '.*' -name '*.sh' -type f -exec basename "{}" \; | sort | cut -d'.' -f1  | sed -e 's/^/ - /'
    echo
    echo "Documentation"
    echo
    cat "${USD_DOCS}/$USD_SERVICE.md"
    echo
    exit 1
fi

if [ "$1" == "env" ]
then
    printServiceEnvironment
    exit
fi

USD_COMMAND="$1"

if [ ! -f "$USD_SCRIPTS/$USD_SERVICE/$USD_COMMAND.sh" ]
then
    showHeader
    echo "Useful Script commans 'usdocker $USD_SERVICE $USD_COMMAND' does not exists"
    echo
    exit 1
fi
shift

if [ "$USD_SERVICE" != ".autocomplete" ] && [ "$USD_SERVICE" != "docker" ]; then  
    checkDockerInstalled
fi
source "${USD_SCRIPTS}/${USD_SERVICE}/${USD_COMMAND}.sh"
