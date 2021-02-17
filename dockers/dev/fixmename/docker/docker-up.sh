#!/bin/sh

echo "> DOCKER UP - BEGIN"

/docker/docker-base.sh
/docker/compile.sh

echo "< DOCKER UP - END"

#yarn encore dev
