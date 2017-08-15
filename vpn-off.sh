#!/bin/bash
set -eu

pp_devs=$(ifconfig | grep ppp | awk '{print $1}')
echo "$pp_devs"

if [[ ! -z "$pp_devs" ]] ; then
    sudo route del default dev $(echo $pp_devs | tail -1)
fi

cd "$(dirname $0)/vpn"
./ipv4.sh
