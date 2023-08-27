#!/usr/bin/env bash

set -Eeuo pipefail

# source "vars.sh"

workdir=$(pwd)

GO_VERSION="1.20"
# sudo apt update && sudo apt upgrade -y

dependancies="build-essential ca-certificates curl gcc g++ make cmake pkg-config llvm-dev libclang-dev clang curl"

sleep 1
printf "\n\nInstalling dependancies = $dependancies\n"
sudo apt install $dependancies -y

sleep 1
printf "\n\nInstalling Go, version=$GO_VERSION\n"
go_url="https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz"
wget $go_url
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
rm go$GO_VERSION.linux-amd64.tar.gz
echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.bashrc

sleep 1
printf "\n\nInstalling Rust...\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
echo "export PATH=$PATH:$HOME/.cargo/env" >> $HOME/.bashrc

souce $HOME/.bashrc

sleep 1
erigon_branch="devel"
erigon_github="https://github.com/ledgerwatch/erigon.git"
printf "\n\nInstalling Erigon... branch=$erigon_branch\n"

git clone $erigon_github
cd erigon && make erigon
echo "export PATH=$PATH:$(pwd)/build/bin" >> $HOME/.bashrc

cd $workdir