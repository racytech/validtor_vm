#!/usr/bin/env bash

# Start Erigon execution client

source "./common.sh"
source "$HOME/.bashrc"
export PATH=$PATH:/home/racytech/validtor_vm/erigon/build/bin
# exec erigon \
#     --datadir=$DATA_DIR/erigon \
#     --chain=holesky > /dev/null 2>&1 &

erigon \
--datadir=$DATA_DIR/erigon \
--chain=holesky