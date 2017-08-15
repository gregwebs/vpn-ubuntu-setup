#!/bin/bash
set -eux
set -o pipefail

cd "$(dirname $0)"

# This is needed sometimes
service xl2tpd restart

output=$(ipsec up karius)
echo "$output"

password=$(whiptail --passwordbox "password" 10 50 3>&1 1>&2 2>&3)

echo "c karius greg@kariusdx.com $password" > /var/run/xl2tpd/l2tp-control


# TODO: check for successful connection
# How to do this besides looking at the x2ltpd log?


./add-gateway.sh

# wait for ppp interface
while ! ifconfig | grep ppp ; do
  echo "waiting for ppp interface to come online"
  sleep 1
done

./route-default.sh

./ipv4.sh
