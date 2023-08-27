#!/usr/bin/env bash

set -Eeuo pipefail

workdir=$(pwd)

sleep 1
erigon_branch="devel"
erigon_github="https://github.com/ledgerwatch/erigon.git"
printf "\n\nInstalling Erigon... branch=$erigon_branch\n"

git clone $erigon_github
cd erigon && git checkout $erigon_branch && make erigon
echo "export PATH=$PATH:$(pwd)/build/bin" >> $HOME/.bashrc

cd $workdir

sleep 1
lighthouse_branch="unstable"
lighthouse_github="https://github.com/sigp/lighthouse.git"
printf "\n\nInstalling Lighthouse... branch=$lighthouse_branch\n"

git clone $lighthouse_github

cd lighthouse && git checkout $lighthouse_branch && make

cd $workdir