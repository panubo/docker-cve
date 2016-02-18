#!/usr/bin/env bash

set -e

IMAGES=$(cat images.conf)

for I in $IMAGES; do
    docker pull $I
done
