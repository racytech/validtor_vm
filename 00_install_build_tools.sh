#!/usr/bin/env bash

set -Eeuo pipefail

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

source $HOME/.bashrc

sleep 1
printf "\n\nInstalling eth2-val-tools\n"
github_url=https://github.com/protolambda/eth2-val-tools.git

git clone $github_url
cd eth2-val-tools
# Install this assignments tool
go install .
# Move out of this dir
cd ..
# Install ethereal
GO111MODULE=on go install github.com/wealdtech/ethereal@latest



cd $workdir
