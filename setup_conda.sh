#!/bin/bash

sha256sum "$1"
bash "$1"
source ~/.bashrc
conda update conda
echo "done"
