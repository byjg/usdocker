#!/usr/bin/env bash

# Setup Environment
setupEnvironment elasticsearch/environment ELASTICSEARCH_IMAGE docker.elastic.co/elasticsearch/elasticsearch:5.2.2
setupEnvironment elasticsearch/environment ELASTICSEARCH_FOLDER \${USD_DATA}/elasticsearch
setupEnvironment elasticsearch/environment ELASTICSEARCH_MEMORY 1g
setupEnvironment elasticsearch/environment ELASTICSEARCH_PORT 9200

source "$USD_HOME/elasticsearch/environment"

# Reset
resetQuestion $1
resetEnvironment $1
resetData $1 ELASTICSEARCH_FOLDER
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

if [ ! -d "$USD_HOME/elasticsearch/conf" ]
then
    mkdir -p "$USD_HOME/elasticsearch"
    cp -r "$USD_SCRIPTS/elasticsearch/conf" "$USD_HOME/elasticsearch"
fi

if [ ! -d "$USD_DATA/elasticsearch/data" ]
then
    mkdir -p "$USD_DATA/elasticsearch/data"
    sudo chown 1000:1000 -R "$USD_DATA/elasticsearch/data"
fi






