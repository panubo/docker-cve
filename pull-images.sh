#!/bin/bash


IMAGES=$(cat images.conf)


for I in $IMAGES; do
    docker pull $I
done
