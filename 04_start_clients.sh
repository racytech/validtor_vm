#!/usr/bin/env bash

# Starts clients.

set -Eeuo pipefail

source "./common.sh"
source $HOME/.bashrc
# Start Erigon


mkdir -p $LOG_DIR
mkdir -p $DATA_DIR

print_step "Starting Ergion" 1

execute_command_add_PID erigon.log ./erigon.sh
# execute_command_add_PID lighthouse_beacon.log ./lighthouse_beacon.sh
# execute_command_add_PID lighthouse_validator.log ./lighthouse_validator.sh
