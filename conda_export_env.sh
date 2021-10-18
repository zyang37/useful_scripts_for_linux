#!/bin/bash

# this line will export current env -> yml file
conda env export > environment.yml

# build from a conda env from yml file
# conda env create -f environment.yml
