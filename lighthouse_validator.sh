#!/usr/bin/env bash

# Start Lighthouse Validator client

source "./common.sh"
source $HOME/.bashrc


# lighthouse --network holesky account validator import --directory validator_keys

exec lighthouse \
    vc \
    --network holesky \
    --suggested-fee-recipient "0x4242424242424242424242424242424242424242"