#!/usr/bin/env bash

# Environment
setupEnvironment ${USD_SERVICE}/environment IMAGE jekyll/jekyll:3.5
setupEnvironment ${USD_SERVICE}/environment PORT 4000
source "$USD_HOME/${USD_SERVICE}/environment"

# Reset
resetQuestion $1
resetEnvironment $1
resetFinsih $1

# Set Key and Value
setKeyValue $1 $2 $3

# Data
JEKYLL_FOLDER="$1"
if [ -z "$1" ]; then
    JEKYLL_FOLDER="$PWD"
fi
