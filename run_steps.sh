#!/usr/bin/env bash

# run VM and validator preporation steps
./steps/01_install_build_tools.sh
./steps/02_install_erigon_lighthouse.sh
./steps/03_install_staking_deposit_cli.sh
# ./steps/04_gen_validators.sh
# ./steps/05_import_validators.sh