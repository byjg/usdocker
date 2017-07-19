#!/usr/bin/env bash

source "$USD_SCRIPTS/${USD_SERVICE}/setup.sh"

dockerDown $USD_SERVICE -$1
