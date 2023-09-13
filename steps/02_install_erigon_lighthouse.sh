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
# erigon_branch="devel"
# erigon_github="https://github.com/ledgerwatch/erigon.git"
erigon_release="2.49.1"
erigon_download_url="https://github.com/ledgerwatch/erigon/releases/download/v$erigon_release/erigon_${erigon_release}_linux_amd64.tar.gz"

wget $erigon_download_url

tar -xvf erigon_${erigon_release}_linux_amd64.tar.gz -C $BINARIES/erigon

print_done


# 3. Install Lighthouse
print_step_sleep "Installing Lighthouse" 1
# lighthouse_branch="unstable"
# lighthouse_github="https://github.com/sigp/lighthouse.git"
lighthouse_release="4.4.1"
lighthouse_download_url="https://github.com/sigp/lighthouse/releases/download/v$lighthouse_release/lighthouse-v$lighthouse_release-x86_64-unknown-linux-gnu.tar.gz"

wget $lighthouse_download_url

tar -xvf lighthouse-v$lighthouse_release-x86_64-unknown-linux-gnu.tar.gz -C $BINARIES/lighthouse

print_done

# cd $workdir