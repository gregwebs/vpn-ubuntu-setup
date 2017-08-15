#!/bin/bash
set -eu
set -o pipefail

# route through the VPN
pp_devs=$(ifconfig | grep ppp | awk '{print $1}')
route add default dev $(echo "$pp_devs" | tail -1)
