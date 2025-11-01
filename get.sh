#!/bin/bash

# exit on error
set -eEo pipefail

if [ -d ${HOME}/.local/share/hyprkiss ]; then
    echo "hyprkiss is already cloned to ${HOME}/.local/share/hyprkiss"
    echo ":: remove it first by running"
    echo "        rm -rf ${HOME}/.local/share/hyprkiss"
    exit 1;
fi

echo ":: cloning hyprkiss to ${HOME}/.local/share/hyprkiss"
git clone https://github.com/nerdwave-nick/hyprkiss ${HOME}/.local/share/hyprkiss  &> /dev/null

cd ${HOME}/.local/share/hyprkiss &> /dev/null && ./install.sh
