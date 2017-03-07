#!/usr/bin/env bash

setupEnvironment php/environment PHP_SHARE_USER ${UID}
setupEnvironment php/environment PHP_SHARE_GROUP ${GROUPS[0]}
source "$USD_HOME/php/environment"
