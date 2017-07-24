#!/usr/bin/env bash

# Environment
setupEnvironment ${USD_SERVICE}/environment IMAGE56 byjg/php56:alpine
setupEnvironment ${USD_SERVICE}/environment IMAGE7 byjg/php7:alpine
setupEnvironment ${USD_SERVICE}/environment SHARE_USER \${UID}
setupEnvironment ${USD_SERVICE}/environment SHARE_GROUP \${GROUPS[0]}
source "$USD_HOME/${USD_SERVICE}/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
#resetData $1 $PHP_FOLDER
resetFinsih $1

# Set Key and Value
setKeyValue "$1" "$2" "$3"

# Data
