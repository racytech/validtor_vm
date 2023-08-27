#!/usr/bin/env bash

set -Eeuo pipefail

workdir=$(pwd)

declare -i n_validators

echo "Enter mnemonic (the one used for generating pubkeys): "
read mnemonic
# echo $mnemonic

echo -n "Enter number of validators (this has to be equal to the number pubkeys generated using the same mnemonic): "
read n_validators
# ((n_validators = n_validators + 1))
echo $n_validators


eth2-val-tools keystores --source-mnemonic "$mnemonic" --source-min 0 --source-max $n_validators

