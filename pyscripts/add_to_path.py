#!/usr/bin/env python3

import argparse
import os
from pathlib import Path

parser = argparse.ArgumentParser(prog="add_to_path")

parser.add_argument('--dirs', help='directory to add to the PATH', required=True)

args = vars(parser.parse_args())

def normalize_args(args):
    dirs=args.get('dirs')
    arr = dirs.split(",")
    return arr

def add_to_path(paths, file):
    with open(file, "a") as f:
        f.writelines(["export PATH=$PATH:" + path + "\n" for path in paths])

# # TODO: may be better to pass arguments list and a file to add to
# # requires manual addition now
# PATHS = [
#     "/usr/local/go/bin",
#     "$HOME/.cargo/env",
# ]

FILE = os.path.join(Path().home(), ".bashrc")
paths = normalize_args(args)
add_to_path(paths, FILE) 