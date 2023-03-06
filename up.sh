#!/bin/bash

#pass first line of 'xauth list' command response of host machine in the container
#this data is needed to access host's X Server
XAUTH_FIRST_LINE=$(xauth list | head -n 1)

TOKEN=$(echo "$XAUTH_FIRST_LINE" | cut -d" " -f5)

FULL_DISPLAY=$(echo "$XAUTH_FIRST_LINE" | cut -d" " -f1)

DISPLAY_NUMBER=$(echo "$DISPLAY" | cut -d":" -f2)

DISPLAY_HOST=$(echo "$FULL_DISPLAY" | cut -d":" -f1)

COOKIE=$(echo "$XAUTH_FIRST_LINE" | cut -d" " -f3)

DISPLAY_ACCESS=$"$DISPLAY_HOST:$DISPLAY_NUMBER $COOKIE $TOKEN"
export DISPLAY_ACCESS

#building and running container
docker-compose up --build --remove-orphans
