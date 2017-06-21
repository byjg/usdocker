#!/usr/bin/env bash

# Environment
setupEnvironment ${USD_SERVICE}/environment JEKYLL_IMAGE jekyll/jekyll:3.5
setupEnvironment ${USD_SERVICE}/environment JEKYLL_PORT 4000
source "$USD_HOME/${USD_SERVICE}/environment"

# Set Key and Value
setKeyValue $1 $2 $3

# Data
JEKYLL_FOLDER="$1"
if [ -z "$1" ]; then
    JEKYLL_FOLDER="$PWD"
fi
