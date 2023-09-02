#!/usr/bin/env bash

set -Eeuo pipefail

workdir=$(pwd)

## 2. Install staking-deposit-cli
sleep 1
printf "\n\nInstalling staking-deposit-cli\n"
github_url=https://github.com/ethereum/staking-deposit-cli.git

if [ ! -d "./staking-deposit-cli" ]; then
    git clone $github_url
fi

cd staking-deposit-cli
git pull
pip3 install -r requirements.txt
sudo python3 setup.py install


cd $workdir