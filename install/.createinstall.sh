#!/usr/bin/env bash

if [ -x "`which realpath`" ]
then
    BASEDIR=`realpath $0`
    BASEDIR=`dirname $BASEDIR`
else
    BASEDIR="$(dirname "$(readlink -f "$0")")"
fi

cd $BASEDIR/../../
echo "From: $PWD"

if [ -z "$1" ]; then
    echo Please specify the script name
    exit 1
fi

PAYLOAD=__usdocker__$RANDOM.tar.gz
SCRIPT=$1
TMP=__extract__$RANDOM

if [ ! -z "$TRAVIS_TAG" ]; then
    echo "v$TRAVIS_TAG" > usdocker/.version
else
    BRANCH=$(cat usdocker/.git/HEAD | cut -d/  -f 3)
    HASH=$(cat usdocker/.git/`cat usdocker/.git/HEAD | cut -d \  -f 2` | cut -c1-7)
    echo "build ($BRANCH@$HASH)" > usdocker/.version
fi

tar czvf $PAYLOAD usdocker

printf "#!/usr/bin/env bash
if [[ \$EUID -ne 0 ]]; then
   echo \"This script must be run as root\" 1>&2
   exit 1
fi
rm -rf /opt/usdocker
PAYLOAD_LINE=\`awk '/^__PAYLOAD_BELOW__/ {print NR + 1; exit 0; }' \$0\`
tail -n+\$PAYLOAD_LINE \$0 | tar -xvz -C /opt
/opt/usdocker/install/install.sh
exit 0
__PAYLOAD_BELOW__\n" > "$TMP"

cat "$TMP" "$PAYLOAD" > "$SCRIPT"
chmod +x "$SCRIPT"
rm "$TMP"
rm "$PAYLOAD"
