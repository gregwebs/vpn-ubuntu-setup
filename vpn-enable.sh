#!/bin/bash
set -eu

cd "$(dirname $0)"
if ! [[ ${IP_ADDR+undefined-guard} ]] ; then
    echo "must set the IP_ADDR" >&2
    exit 1
fi

exec sudo vpn/vpn-enable.sh "$@"
