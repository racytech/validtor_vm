#!/usr/bin/env bash

# Start Lighthouse Validator client

source "./common.sh"
source $HOME/.bashrc



exec lighthouse vc --network holesky --suggested-fee-recipient "0x4242424242424242424242424242424242424242" > /dev/null 2>&1 &