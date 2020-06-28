#!/bin/sh
set -eu
CHECK_SERVER="$(redis-cli -p "$1" -a "$AUTH" ping)"

if [ "$CHECK_SERVER" != "PONG" ] && [ "$CHECK_SERVER" != "LOADING Redis is loading the dataset in memory" ]; then
    echo "Server check failed with: $CHECK_SERVER"
    exit 1
fi

