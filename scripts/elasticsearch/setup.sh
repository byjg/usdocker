#!/usr/bin/env bash

# Setup Environment
setupEnvironment ${USD_SERVICE}/environment IMAGE docker.elastic.co/elasticsearch/elasticsearch:5.5.0
setupEnvironment ${USD_SERVICE}/environment FOLDER \${USD_DATA}/${USD_SERVICE}
setupEnvironment ${USD_SERVICE}/environment MEMORY 1g
setupEnvironment ${USD_SERVICE}/environment PORT 9200
setupEnvironment ${USD_SERVICE}/environment TRANSPORT 9300
setupEnvironment ${USD_SERVICE}/environment CLUSTER_NAME docker-cluster
setupEnvironment ${USD_SERVICE}/environment NODE_NAME $(hostname)
setupEnvironment ${USD_SERVICE}/environment PUBLISH_ADDRESS $(ip route get 1 | head -1 | cut -d' ' -f8)
setupEnvironment ${USD_SERVICE}/environment DISCOVERY_NODES
setupEnvironment ${USD_SERVICE}/environment NODE_MASTER true
setupEnvironment ${USD_SERVICE}/environment NODE_DATA true
setupEnvironment ${USD_SERVICE}/environment NODE_INGEST true

source "$USD_HOME/${USD_SERVICE}/environment"

# Reset
resetQuestion $1
resetEnvironment $1
resetData $1 "$ELASTICSEARCH_FOLDER"
resetFinsih $1

# Set Key and Value
setKeyValue "$1" "$2" "$3"

if [ ! -d "$USD_HOME/${USD_SERVICE}/conf" ]
then
    mkdir -p "$USD_HOME/${USD_SERVICE}"
    cp -r "$USD_SCRIPTS/${USD_SERVICE}/conf" "$USD_HOME/${USD_SERVICE}"
fi

if [ ! -d "$USD_DATA/${USD_SERVICE}/data" ]
then
    echo "Fixing directories permission (requires sudo)"
    mkdir -p "$USD_DATA/${USD_SERVICE}/data"
    sudo chown 1000:1000 -R "$USD_DATA/${USD_SERVICE}/data"
fi






