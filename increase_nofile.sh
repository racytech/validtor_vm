#!/usr/bin/env bash

set -Eeuo pipefail

username=$(whoami)
hard_files=16384
soft_files=8192

      #racytech        hard     nofile         16384
hard="$username        hard     nofile         $hard_files"
soft="$username        soft     nofile         $soft_files"

echo "Add lines below to the /etc/security/limits.conf to increase number of open files"
echo "$hard"
echo "$soft"