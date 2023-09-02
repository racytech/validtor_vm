#!/usr/bin/env bash

set -Eeuo pipefail

GO_VERSION="1.20"

## 1. update && upgrade vm
sudo apt update && sudo apt upgrade -y

## 2. Install dependencies
dependencies="build-essential ca-certificates curl gcc g++ make cmake pkg-config llvm-dev libclang-dev clang python3-pip"
sleep 1
printf "\n\nInstalling dependencies = $dependencies\n"
sudo apt install $dependencies -y


## 3. Install Go
sleep 1
printf "\n\nInstalling Go, version=$GO_VERSION\n"
go_url="https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz"
wget $go_url
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
rm go$GO_VERSION.linux-amd64.tar.gz


## 4. Install Rust
sleep 1
printf "\n\nInstalling Rust...\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y


## 5. Add Go and Rust to the PATH (.bashrc)
$(pwd)/pyscripts/add_to_path.py

source $HOME/.bashrc

