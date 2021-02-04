#!/bin/sh

echo "> DOCKER START - BEGIN"

/docker/docker-base.sh

#service supervisor start

echo "< DOCKER START - END"

echo "> WATCHING ASSETS"

#yarn encore dev --watch --verbose
