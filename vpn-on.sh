#!/bin/bash
set -eu
set -o pipefail

sudo vpn/route-default.sh "$@"

cd "$(dirname $0)/vpn"
./ipv4.sh
