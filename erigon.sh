#!/usr/bin/env bash

# Start Erigon execution client

source "./common.sh"
source "$HOME/.bashrc"
export PATH=$PATH:$HOME/validtor_vm/erigon/build/bin


# exec $ERIGON_BINDIR/erigon \
#     --log.dir.verbosity=dbug \
#     --datadir=$HOME/.erigon \
#     --chain=holesky > /dev/null 2>&1 &

$ERIGON_BINDIR/erigon \
--datadir=$DATA_DIR/erigon \
--chain=holesky \
--http.vhosts=any \