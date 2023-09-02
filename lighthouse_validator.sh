#!/usr/bin/env bash

# Start Lighthouse Validator client

source "./common.sh"
source $HOME/.bashrc

echo "Enter the path to the file containing the password for validator_keys: "
read pswd_file

echo $pswd_file

echo "Enter suggested-fee-recipient: "
read $suggested_fee_recipient

echo $suggested_fee_recipient


lighthouse --network holesky account validator import --directory validator_keys --password-file $pswd_file --reuse-password

# rm $pswd_file

exec lighthouse vc --network holesky --suggested-fee-recipient "0x4242424242424242424242424242424242424242" > /dev/null 2>&1