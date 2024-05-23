#!/usr/bin/env bash

# Start Lighthouse Validator client

source "./common.sh"
source "$HOME/.bashrc"

# echo "Enter suggested-fee-recipient: "
# read suggested_fee_recipient

# echo $suggested_fee_recipient

# if [ -z "$suggested_fee_recipient" ]; then
#     echo "suggested-fee-recipient is empty... exiting..."
#     exit 1
# fi

# exec lighthouse vc --network holesky --suggested-fee-recipient "$suggested_fee_recipient" > /dev/null 2>&1 &

exec $LIGHTHOUSE_BINDIR/lighthouse \
vc \
--logfile-max-size 40 \
--logfile-debug-level info \
--beacon-nodes=http://localhost:5052/ \
--network holesky \
--suggested-fee-recipient 0x442981708b6d59A62dD622616720a3518a2f96F0 > /dev/null 2>&1 &

# $LIGHTHOUSE_BINDIR/lighthouse \
# vc --network holesky --suggested-fee-recipient "$suggested_fee_recipient"
