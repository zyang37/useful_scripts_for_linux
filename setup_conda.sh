#!/bin/bash

sha256sum "$1"
bash "$1"
source ~/.bashrc
conda update conda

conda config --add channels conda-forge
conda config --set channel_priority strict

echo "done"
