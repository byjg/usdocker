#!/usr/bin/env bash

# Environment
setupEnvironment php/environment PHP_SHARE_USER \${UID}
setupEnvironment php/environment PHP_SHARE_GROUP \${GROUPS[0]}
source "$USD_HOME/php/environment"

# Reset Question
resetQuestion $1
resetEnvironment $1
#resetData $1 $PHP_FOLDER
resetFinsih $1

# Data
