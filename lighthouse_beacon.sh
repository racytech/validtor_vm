#!/usr/bin/env bash

# Start Lighthouse Beacon client  

source "./common.sh"
source $HOME/.bashrc


exec lighthouse \
    bn \
    --datadir $DATA_DIR/lighthouse_beacon \
    --network holesky \
    --execution-endpoint="http://localhost:8551" \
    --execution-jwt=$DATA_DIR/erigon/jwt.hex