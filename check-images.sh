#!/usr/bin/env bash

IMAGES=$(docker images | awk '{print $1":"$2}' | egrep -v 'REPOSITORY|<none>' | sort -u )

for I in $IMAGES; do
    echo -n "$I - "
    ID=$(docker run -d --entrypoint=/bin/sh -v /mnt:/mnt $I /mnt/wait.sh)
    EXEC=$(docker exec -it $ID sh -c "/mnt/cve-2015-7547.sh" 2>/dev/null)
    if [ "$?" -ne "0" ]; then
        echo "Container FAILED"
    else
        echo $EXEC
    fi
    docker rm -f $ID 1> /dev/null
done
