#!/bin/bash
net_count_test=`docker network ls  | grep ' fixmename_net ' | wc -l`
if [ "$net_count_test" == "1" ]
then
  echo "NETWORK ALREADY EXISTS - fixmename_net"
  exit
fi

docker network create --driver=bridge --subnet=172.16.01.0/24 --ip-range=172.16.01.0/24 --gateway=172.16.01.1 fixmename_net
echo "NEW NETWORK CREATED - fixmename_net"
