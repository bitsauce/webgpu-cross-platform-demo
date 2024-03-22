#!/bin/bash

set -e
THIRD_PARTY="$(dirname "$0")"/third_party/

mkdir -p "$THIRD_PARTY"
cd "$THIRD_PARTY"
if [ ! -e dawn/ ] ; then
    git clone https://dawn.googlesource.com/dawn dawn/
    cd dawn/
else
    cd dawn/
    git fetch origin
fi

# Use the most recent version of dawn
git checkout --detach origin/main --

# Fetch dependencies using the fetch script (works without gsync login)
python tools/fetch_dawn_dependencies.py
