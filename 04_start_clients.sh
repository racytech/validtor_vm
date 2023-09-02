#!/usr/bin/env bash

# Starts clients.

source "./05_common.sh"
source $HOME/.bashrc
# Start Erigon

print_step "Starting Ergion" 1

erigon -h

