#!/usr/bin/env bash

# Installs erigon and lighthouse. Erigon will be added to the PATH in .bashrc


set -Eeuo pipefail

source "./common.sh"

export PATH=$PATH:/usr/local/go/bin
source "$HOME/.cargo/env"

workdir=$(pwd)

# 1. Install Erigon:
# - clone if erigon does not exists
# - checkout to the branch
# - pull
# - make
print_step_sleep "Installing Erigon" 1
erigon_branch="devel"
erigon_github="https://github.com/ledgerwatch/erigon.git"

# Erigon
if [ ! -d "./erigon" ]; then
    git clone $erigon_github
fi
cd erigon
git checkout $erigon_branch
git pull origin $erigon_branch
make erigon

print_done


# 2. Add erigon to the PATH
print_step_sleep "Adding Erigon to the PATH (.bashrc)" 1

$workdir/pyscripts/add_to_path.py --dirs=$(pwd)/build/bin

print_done

cd $workdir

# 3. Install Lighthouse
# - clone if lighthouse does not exists
# - checkout to the branch
# - pull
# - make
print_step_sleep "Installing Lighthouse" 1
lighthouse_branch="unstable"
lighthouse_github="https://github.com/sigp/lighthouse.git"

# Lighthouse
if [ ! -d "./lighthouse" ]; then
    git clone $lighthouse_github
fi

cd lighthouse
git checkout $lighthouse_branch
git pull origin $lighthouse_branch
make

print_done

cd $workdir