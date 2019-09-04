#!/bin/bash

echo "List of users"

sudo docker-compose run --rm openvpn ovpn_listclients
