#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

curl https://github.com/docker/compose/releases/ | grep https://github.com/docker/compose/releases/ | cut -d'>' -f 3- | cut -d '&' -f 1 > /tmp/docker-compose-releases

LATEST_RELEASE_INSTALL=`head -n 1 /tmp/docker-compose-releases`
LATEST_RELEASE=`echo "${LATEST_RELEASE_INSTALL}" | cut -d'/' -f 8`
DESTINATION="/usr/local/bin/docker-compose"

echo "This script will install the docker-compose"
echo
echo "VERSION: $LATEST_RELEASE"
echo "DESTINATION: $DESTINATION"
echo
echo "Press ENTER to continuer or CTRL-C for abort"
read

# Install Docker compose
curl -L https://github.com/docker/compose/releases/download/${LATEST_RELEASE}/docker-compose-`uname -s`-`uname -m` > ${DESTINATION}
chmod a+x ${DESTINATION}

# Install Debian auto-complete
wget https://raw.githubusercontent.com/docker/compose/${LATEST_RELEASE}/contrib/completion/bash/docker-compose -O /etc/bash_completion.d/docker-compose
