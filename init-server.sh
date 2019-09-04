#!/bin/bash

echo "Creating a new server config"

sudo docker-compose run --rm openvpn ovpn_genconfig \
    -u udp://citycard.ru:43500 \
    -2 \
    -C AES-256-CBC \
    -s 10.250.0.0/24 \
    -p 'route 172.31.0.0 255.255.0.0' \
    -D -b -z -d -N

sudo docker-compose run --rm openvpn ovpn_initpki


#cat openvpn-data/conf/openvpn.conf
