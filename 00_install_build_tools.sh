#!/usr/bin/env bash

set -Eeuo pipefail

workdir=$(pwd)

GO_VERSION="1.20"

## 0. update && upgrade vmru
sudo apt update && sudo apt upgrade -y

## 1. Install dependencies
dependencies="build-essential ca-certificates curl gcc g++ make cmake pkg-config llvm-dev libclang-dev clang git"
sleep 1
printf "\n\nInstalling dependencies = $dependencies\n"
sudo apt install $dependencies -y


## 2. Install Go
sleep 1
printf "\n\nInstalling Go, version=$GO_VERSION\n"
go_url="https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz"
wget $go_url
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
rm go$GO_VERSION.linux-amd64.tar.gz


## 2. Install Rust
sleep 1
printf "\n\nInstalling Rust...\n"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y


cd $workdir

## 3. Add Go and Rust to the PATH (.bashrc)
$(pwd)/pyscripts/add_to_path.py 

source $HOME/.bashrc

