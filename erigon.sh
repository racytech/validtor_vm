#!/usr/bin/env bash

# Start Erigon execution client

source "./common.sh"
source $HOME/.bashrc

exec erigon \
    --datadir=$DATA_DIR/erigon \
    --chain=holesky \