#!/bin/bash
set -eux
set -o pipefail

gateway=$(ip route | grep default | grep -v ppp | awk '{print $3}')
echo "gateway: $gateway"
if ! route | grep "$IP_ADDR" ; then
    route add "$IP_ADDR" gw $gateway
fi
