#!/bin/sh

docker exec -d fixmename_web_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d fixmename_fpm_1 sh -c "sh /docker/tmp/fix-hosts.sh"
docker exec -d fixmename_db_1 sh -c "sh /docker/tmp/fix-hosts.sh"

docker exec -d fixmename_fpm_1 sh -c "sh /docker/docker-start.sh >> /var/log/docker-start.log"
