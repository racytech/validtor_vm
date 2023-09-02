#!/usr/bin/env bash

# Start Lighthouse Validator client

source "./common.sh"
source $HOME/.bashrc


lighthouse --network holesky account validator import --directory validator_keys

# exec lighthouse \
#     --debug-level $DEBUG_LEVEL
#     vc \
#     --datadir $DATA_DIR/lighthouse_validator \
#     --network holesky \
#     --execution-jwt=$DATA_DIR/erigon/jwt.hex