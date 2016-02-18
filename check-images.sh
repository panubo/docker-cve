#!/usr/bin/env bash

IMAGES=${@:-$(docker images | awk '{print $1":"$2}' | egrep -v 'REPOSITORY|<none>' | sort -u )}
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for I in $IMAGES; do
    echo -n "$I - "
    ID=$(docker run -d --entrypoint=/bin/sh -v ${DIR}:${DIR} $I ${DIR}/wait.sh)

    for C in $DIR/checks/*.sh; do
        EXEC=$(docker exec -it $ID sh -c "$C" 2>/dev/null)
        if [ "$?" -ne "0" ]; then
            echo "Container FAILED"
        else
            echo "$EXEC"
        fi
    done
    docker rm -f $ID 1> /dev/null
done
