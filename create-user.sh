#!/bin/bash

echo "Creating a new user"



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

OVPN_DATA=$(pwd)/openvpn-data/conf

#echo "Creating "$CLIENTNAME

export OVPN_COMP_LZO=1

# with a passphrase 
#sudo docker-compose run --rm openvpn easyrsa build-client-full $CLIENTNAME 

sudo docker run -v $OVPN_DATA:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full $CLIENTNAME nopass

echo "Gen user data"

sudo docker run -v $OVPN_DATA:/etc/openvpn --rm -t kylemanna/openvpn ovpn_otp_user $CLIENTNAME


echo  "WRITE CLIENT CONFIG"
sudo docker-compose run --rm -e OVPN_COMP_LZO=1 -e OVPN_DEFROUTE=0  openvpn  ovpn_getclient $CLIENTNAME > ${CLIENTNAME}-citycard.ovpn

#sudo docker-compose run --rm -it -e OVPN_COMP_LZO=1 -e OVPN_DEFROUTE=0 openvpn ovpn_otp_user $CLIENTNAME
