#!/usr/bin/env bash

# Start Lighthouse Beacon client

source "./common.sh"
source "$HOME/.bashrc"

exec $LIGHTHOUSE_BINDIR/lighthouse \
bn \
--http \
--logfile-max-size 40 \
--network holesky \
--execution-endpoint="http://localhost:8551" \
--execution-jwt=$HOME/.erigon/jwt.hex > /dev/null 2>&1 &

# $LIGHTHOUSE_BINDIR/lighthouse \
# bn \
# --http \
# --datadir $DATA_DIR/lighthouse_beacon \
# --network holesky \
# --execution-endpoint="http://localhost:8551" \
# --execution-jwt=$DATA_DIR/erigon/jwt.hex