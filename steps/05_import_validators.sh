#!/usr/bin/env bash

set -Eeuo pipefail

source "./common.sh"
source "$HOME/.bashrc"

workdir=$(pwd)


print_step_sleep "Importing validator keys to Lighthouse" 1

echo "Enter the path to the file containing the password for validator_keys (defaults to pswd.txt): "
read pswd_file

echo $pswd_file
if [ -z "$pswd_file" ]; then
    echo "defaulting to pswd.txt, make sure pswd.txt has the same password you entered during validators creation"
    read -p "Press [Enter] when ready..."
    pswd_file="pswd.txt"
fi


lighthouse --network holesky account validator import --directory $workdir/validator_keys --password-file $pswd_file --reuse-password

cd $workdir