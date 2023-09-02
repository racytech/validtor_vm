#!/usr/bin/env bash

set -Eeuo pipefail

workdir=$(pwd)

sleep 1
erigon_branch="devel"
erigon_github="https://github.com/ledgerwatch/erigon.git"
printf "\n\nInstalling Erigon... branch=$erigon_branch\n"

# Erigon
if [ ! -d "./erigon" ]; then
    git clone $erigon_github
fi
cd erigon
git checkout $erigon_branch
git pull origin $erigon_branch
make erigon

$workdir/pyscripts/add_to_path.py --dirs=$(pwd)/build/bin

cd $workdir

sleep 1
lighthouse_branch="unstable"
lighthouse_github="https://github.com/sigp/lighthouse.git"
printf "\n\nInstalling Lighthouse... branch=$lighthouse_branch\n"

# Lighthouse
if [ ! -d "./lighthouse" ]; then
    git clone $lighthouse_github
fi

cd lighthouse
git checkout $lighthouse_branch
git pull origin $lighthouse_branch
make

cd $workdir