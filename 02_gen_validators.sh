#!/usr/bin/env bash

set -Eeuo pipefail

workdir=$(pwd)

if [ ! -d "./staking-deposit-cli" ]; then
    echo "Install staking-deposit-cli..."
    exit 1
fi

declare -i n_validators

echo "Enter mnemonic (the one used for generating pubkeys): "
read mnemonic
echo $mnemonic

echo -n "Enter number of validators (this has to be equal to the number pubkeys generated using the same mnemonic): "
read n_validators
# # ((n_validators = n_validators + 1))
echo $n_validators

cd staking-deposit-cli

./deposit.sh existing-mnemonic --num_validators=$n_validators --validator_start_index=0 --chain=holesky --mnemonic="$mnemonic" --folder=$workdir

cd $workdir

# eth2-val-tools keystores --source-mnemonic "$mnemonic" --source-min 0 --source-max $n_validators