#!/usr/bin/env bash

# Installs staking-deposit-cli https://github.com/ethereum/staking-deposit-cli
# staking-deposit-cli required for genereting validator_keys
# validator_keys are then used by lighthouse validator client

set -Eeuo pipefail

source "./common.sh"

workdir=$(pwd)

## 2. Install staking-deposit-cli
print_step_sleep "Installing staking-deposit-cli" 1

github_url=https://github.com/ethereum/staking-deposit-cli.git

if [ ! -d "./staking-deposit-cli" ]; then
    git clone $github_url
fi

cd staking-deposit-cli
git pull

if [ ! -d "./venv" ]; then
    python3 -m venv venv
fi

source venv/bin/activate

pip3 install -r requirements.txt
python3 setup.py install

print_done

cd $workdir