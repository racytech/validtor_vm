#!/usr/bin/env bash

# Ubuntu 23.04 will require

# 1. Updates && upgrades VM
# 2. Installs dependancies, build-tools
# 3. Installs GO for erigon
# 4. Installs Rust for lighthouse

set -Eeuo pipefail

source "./common.sh"

GO_VERSION="1.20"

# 1. update && upgrade vm
print_step_sleep "sudo apt update && sudo apt upgrade -y" 1
sudo apt update && sudo apt upgrade -y

print_done


## 2. Install dependencies
dependencies="build-essential ca-certificates curl gcc g++ make cmake pkg-config llvm-dev libclang-dev clang python3-pip python3-venv"
print_step_sleep "Installing dependencies" 1

sudo apt install $dependencies -y

print_done


## 3. Install Go
print_step_sleep "Installing Go, version=$GO_VERSION" 1

go_url="https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz"
wget $go_url
sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go$GO_VERSION.linux-amd64.tar.gz
rm go$GO_VERSION.linux-amd64.tar.gz

print_done


## 4. Install Rust
print_step_sleep "Installing Rust" 1

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

print_done


## 5. Add Go and Rust to the PATH (.bashrc)
print_step_sleep "Adding Go and Rust to the PATH (.bashrc)" 1

$(pwd)/pyscripts/add_to_path.py --dirs=/usr/local/go/bin,$HOME/.cargo/env

print_done


