#!/usr/bin/env bash

set -Eeuo pipefail

source "./common.sh"
source "$HOME/.cargo/env"

workdir=$(pwd)

sudo cp ./services/erigon.service /etc/systemd/system/
sudo cp ./services/beacon.service /etc/systemd/system/
sudo cp ./services/validator.service /etc/systemd/system/