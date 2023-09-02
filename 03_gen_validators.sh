#!/usr/bin/env bash

# Generates validator_keys in the current directory
# Requires mnemonic and a number of validators that was used to generate public keys

# Promts inputs

# Save the password asked during validator creation to the file, this file path will be needed to import
# validators to Lighthouse


set -Eeuo pipefail

source "./common.sh"

workdir=$(pwd)

print_step_sleep "Generating validator keys" 1

if [ ! -d "./staking-deposit-cli" ]; then
    echo "staking-deposit-cli is not installed..."
    exit 1
fi

declare -i n_validators

echo "Enter mnemonic (the one used for generating pubkeys): "
read mnemonic
echo $mnemonic

echo -n "Enter number of validators (this has to be equal to the number of pubkeys generated using the same mnemonic): "
read n_validators
# # ((n_validators = n_validators + 1))
echo $n_validators

cd staking-deposit-cli

./deposit.sh existing-mnemonic --num_validators=$n_validators --validator_start_index=0 --chain=holesky --mnemonic="$mnemonic" --folder=$workdir

cd $workdir


print_step_sleep "Importing validator keys to Lighthouse" 1

echo "Enter the path to the file containing the password for validator_keys (default pswd.txt): "
read pswd_file

echo $pswd_file
if [ -z "$pswd_file" ]; then
    echo "defaulting to pswd.txt, make sure pswd.txt has the same password you entered during validators creation"
    read -p "Press [Enter] when ready..."
fi

echo "Enter suggested-fee-recipient: "
read suggested_fee_recipient

echo $suggested_fee_recipient


lighthouse --network holesky account validator import --directory $workdir/validator_keys --password-file $pswd_file --reuse-password

# rm $pswd_file

cd $workdir
