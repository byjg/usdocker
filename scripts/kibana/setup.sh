#!/usr/bin/env bash

# Setup Environment
setupEnvironment kibana/environment KIBANA_IMAGE docker.elastic.co/kibana/kibana:5.2.2
setupEnvironment kibana/environment KIBANA_FOLDER \${USD_DATA}/kibana
setupEnvironment kibana/environment KIBANA_PORT 5601
setupEnvironment kibana/environment KIBANA_ELASTICSEARCH_URL http://elasticsearch-container:9200

source "$USD_HOME/kibana/environment"

# Reset
resetQuestion $1
resetEnvironment $1
resetData $1 KIBANA_FOLDER
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

if [ ! -d "$USD_HOME/kibana/conf" ]
then
    mkdir -p "$USD_HOME/kibana"
    cp -r "$USD_SCRIPTS/kibana/conf" "$USD_HOME/kibana"
fi

#if [ ! -d "$USD_DATA/kibana/data" ]
#then
#    mkdir -p "$USD_DATA/kibana/data"
#    sudo chown 1000:1000 -R "$USD_DATA/kibana/data"
#fi
