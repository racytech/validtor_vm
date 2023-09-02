#!/usr/bin/env python3

import os
from pathlib import Path

def add_to_path(paths, file):
    with open(file, "a") as f:
        f.writelines(["export PATH=$PATH:" + path + "\n" for path in paths])

# TODO: may be better to pass arguments list and a file to add to
# requires manual addition now
PATHS = [
    "/usr/local/go/bin",
    "$HOME/.cargo/env",
]

FILE = os.path.join(Path().home(), ".bashrc")

add_to_path(PATHS, FILE) 