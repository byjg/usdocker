#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

wget -qO- https://get.docker.com/ | sh

groupadd docker
gpasswd -a ${SUDO_USER:-$(whoami)} docker
service docker restart

echo "-------------------------------------------------------------------------------------------"
echo "Docker add to the user '${SUDO_USER:-$(whoami)}'"
echo "Maybe you need to run 'newgrp docker' or logout in order to get docker working to this user"
echo "-------------------------------------------------------------------------------------------"
echo 
