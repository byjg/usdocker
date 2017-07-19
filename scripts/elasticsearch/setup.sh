#!/usr/bin/env bash

# Setup Environment
setupEnvironment ${USD_SERVICE}/environment IMAGE docker.elastic.co/elasticsearch/elasticsearch:5.5.0
setupEnvironment ${USD_SERVICE}/environment FOLDER \${USD_DATA}/\${USD_SERVICE}
setupEnvironment ${USD_SERVICE}/environment MEMORY 1g
setupEnvironment ${USD_SERVICE}/environment PORT 9200

source "$USD_HOME/${USD_SERVICE}/environment"

# Reset
resetQuestion $1
resetEnvironment $1
resetData $1 "$ELASTICSEARCH_FOLDER"
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

if [ ! -d "$USD_HOME/${USD_SERVICE}/conf" ]
then
    mkdir -p "$USD_HOME/${USD_SERVICE}"
    cp -r "$USD_SCRIPTS/${USD_SERVICE}/conf" "$USD_HOME/${USD_SERVICE}"
fi

if [ ! -d "$USD_DATA/${USD_SERVICE}/data" ]
then
    mkdir -p "$USD_DATA/${USD_SERVICE}/data"
    mkdir -p "$USD_DATA/${USD_SERVICE}/data/dev"
    mkdir -p "$USD_DATA/${USD_SERVICE}/data/master"
    mkdir -p "$USD_DATA/${USD_SERVICE}/data/data"
    echo "Fix permission (requires sudo)"
    sudo chown 1000:1000 -R "$USD_DATA/${USD_SERVICE}/data"
fi

if [ "$USD_COMMAND" != "setup" ] && [ -z "$1" ]; then
    echo "Supported modes: "
    echo " - dev: only one node for development "
    echo " - master: The master node that controls the cluster "
    echo " - data: Data nodes hold data and perform data related operations "
    echo
    exit 1
fi