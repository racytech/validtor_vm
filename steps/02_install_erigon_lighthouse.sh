#!/usr/bin/env bash

# Installs erigon and lighthouse. Erigon will be added to the PATH in .bashrc


set -Eeuo pipefail

source "./common.sh"
source "$HOME/.cargo/env"
export PATH=$PATH:/usr/local/go/bin

workdir=$(pwd)

mkdir -p $ERIGON_BINDIR
mkdir -p $LIGHTHOUSE_BINDIR

# 1. Install Erigon:
print_step_sleep "Installing Erigon" 1

## Install erigon from release
erigon_release="2.60.0"
erigon_download_url="https://github.com/ledgerwatch/erigon/releases/download/v$erigon_release/erigon_${erigon_release}_linux_amd64.tar.gz"

wget $erigon_download_url

tar -xvf erigon_${erigon_release}_linux_amd64.tar.gz -C $BINARIES/erigon


# ## Build erigon from source
# erigon_branch="devel"
# erigon_github="https://github.com/ledgerwatch/erigon.git"
# if [ ! -d "./erigon" ]; then
#     git clone $erigon_github
# fi

# cd erigon
# git checkout $erigon_branch
# git pull origin $erigon_branch

# make erigon

# cp ./build/bin/erigon $BINARIES/erigon

print_done
cd $workdir


# 3. Install Lighthouse
print_step_sleep "Installing Lighthouse" 1

lighthouse_release="5.1.3"
lighthouse_download_url="https://github.com/sigp/lighthouse/releases/download/v$lighthouse_release/lighthouse-v$lighthouse_release-x86_64-unknown-linux-gnu.tar.gz"

wget $lighthouse_download_url

tar -xvf lighthouse-v$lighthouse_release-x86_64-unknown-linux-gnu.tar.gz -C $BINARIES/lighthouse


### Build lighthouse from source
# lighthouse_branch="unstable"
# lighthouse_github="https://github.com/sigp/lighthouse.git"
# if [ ! -d "./lighthouse" ]; then
#     git clone $lighthouse_github
# fi

# cd lighthouse
# git checkout $lighthouse_branch
# git pull origin $lighthouse_branch

# make

# cp ~/.cargo/bin/lighthouse $BINARIES/lighthouse

print_done

cd $workdir