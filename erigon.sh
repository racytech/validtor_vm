#!/usr/bin/env bash

# Start Erigon execution client

source "./scripts/common.sh"
source $HOME/.bashrc

exec erigon \
    --datadir=$DATA_DIR/erigon \
    --chain=holesky > /dev/null 2>&1 &