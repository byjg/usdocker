#!/usr/bin/env bash

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

curl https://github.com/docker/machine/releases/ | grep https://github.com/docker/machine/releases/ | cut -d'>' -f 3- | cut -d '&' -f 1 > /tmp/docker-machine-releases

LATEST_RELEASE_INSTALL=`head -n 1 /tmp/docker-machine-releases`
LATEST_RELEASE=`echo "${LATEST_RELEASE_INSTALL}" | cut -d'/' -f 8`
DESTINATION="/usr/local/bin/docker-machine"

echo "This script will install the docker-machine"
echo
echo "VERSION: $LATEST_RELEASE"
echo "DESTINATION: $DESTINATION"
echo
echo "Press ENTER to continuer or CTRL-C for abort"
read

# Install Docker machine
curl -L https://github.com/docker/machine/releases/download/${LATEST_RELEASE}/docker-machine-`uname -s`-`uname -m` > ${DESTINATION}
chmod a+x ${DESTINATION}

# Install Debian auto-complete
wget https://raw.githubusercontent.com/docker/machine/${LATEST_RELEASE}/contrib/completion/bash/docker-machine.bash -O /etc/bash_completion.d/docker-machine
wget https://raw.githubusercontent.com/docker/machine/${LATEST_RELEASE}/contrib/completion/bash/docker-machine-prompt.bash -O /etc/bash_completion.d/docker-machine-prompt
wget https://raw.githubusercontent.com/docker/machine/${LATEST_RELEASE}/contrib/completion/bash/docker-machine-wrapper.bash -O /etc/bash_completion.d/docker-machine-wrapper
