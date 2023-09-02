#!/usr/bin/env bash

# Generates validator_keys in the current directory 
# Requires mnemonic and a number of validators that was used to generate public keys

# Promts inputs

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
