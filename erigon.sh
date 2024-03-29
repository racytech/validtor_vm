#!/usr/bin/env bash

# Start Erigon execution client

source "./common.sh"
source "$HOME/.bashrc"
export PATH=$PATH:$HOME/validtor_vm/erigon/build/bin


exec $ERIGON_BINDIR/erigon \
--datadir=$HOME/.erigon \
--chain=holesky \
--http.addr="0.0.0.0" \
--http.vhosts=any > /dev/null 2>&1 &

# $ERIGON_BINDIR/erigon \
# --datadir=$DATA_DIR/erigon \
# --chain=holesky \
# --http.addr="0.0.0.0" \
# --http.vhosts=any \