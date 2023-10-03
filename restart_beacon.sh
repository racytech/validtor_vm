#!/usr/bin/env bash

# Restart beacon on filure

source "./common.sh"
source "$HOME/.bashrc"

while true
do
    pid=$(ps aux | grep 'lighthouse' | grep 'execution-endpoint=http://localhost:8551' | awk '{print $2}')
    if [ -z "$pid" ]; then
        ./lighthouse_beacon.sh
        date_time=$(date -u)
        $date_time >> beacon_fails.txt
        sleep 10 # give sometime for process to start
    fi
    sleep 10
done &


