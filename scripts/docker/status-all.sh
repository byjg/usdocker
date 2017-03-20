#!/usr/bin/env bash

for SCRIPT in `ls $USD_SCRIPTS | grep -v -e "^docker"`; do
    dockerStatus $SCRIPT
done
