#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

if [ -x "`which realpath`" ]
then
    BASEDIR=`realpath $0`
    BASEDIR=`dirname $BASEDIR`
else
    BASEDIR="$(dirname "$(readlink -f "$0")")"
fi

echo "Creating symbolic link..."
ln -sf "`dirname $BASEDIR`/usdocker.sh" /usr/local/bin/usdocker

eval $(cat /etc/*-release | grep =)

if [ "$ID_LIKE" == "debian" ] || [ "$ID" == "debian" ]; then
    echo "Setting auto-complete..."
    ln -sf "`dirname $BASEDIR`/bash_completion_debian.sh" /etc/bash_completion.d/usdocker
elif [ "$ID_LIKE" == "rhel fedora" ] || [ "$ID" == "fedora" ]; then
    echo "Setting auto-complete..."
    ln -sf "`dirname $BASEDIR`/bash_completion_debian.sh" /etc/bash_completion.d/usdocker
fi
