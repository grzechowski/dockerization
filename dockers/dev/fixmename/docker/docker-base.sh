#!/bin/sh

# load settings
. /docker/.settings

# test project directory link
until cd /fixmename
do
    echo "Waiting for project volume mount"
done

# test database start
until [ "$(echo "show databases like 'fixmename'" | mysql -uroot -h172.16.1.104 -pfixmename -N 2>/dev/null | wc -l)" -gt 0 ]
do
  echo "Waiting for database server to start"
  sleep 1
done

# fix storage
for i in `find storage -type d`; do chmod a+rwx $i; done
chmod -R a+rwx bootstrap/cache
