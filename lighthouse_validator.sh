#!/usr/bin/env bash

# Start Lighthouse Validator client

source "./scripts/common.sh"
source $HOME/.bashrc

echo "Enter suggested-fee-recipient: "
read suggested_fee_recipient

echo $suggested_fee_recipient

if [ -z "$suggested_fee_recipient" ]; then
    echo "suggested-fee-recipient is empty... exiting..."
    exit 1
fi

# exec lighthouse vc --network holesky --suggested-fee-recipient "$suggested_fee_recipient" > /dev/null 2>&1 &

lighthouse vc --network holesky --suggested-fee-recipient "$suggested_fee_recipient"