#!/bin/bash

echo "Deleteing a new user"



usage() {
    echo "Usage: $0 <username>"
    echo ""
    exit 1
}


if [ $# -eq 0 ]
then
	usage
	exit 1
fi


CLIENTNAME=$1


sudo docker-compose run --rm openvpn ovpn_revokeclient $CLIENTNAME remove
