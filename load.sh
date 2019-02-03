#!/bin/bash

mkdir -p data/check
./transforms/check.sh ./data/check/
mkdir -p data/download
./transforms/download.sh ./data/check/ ./data/download/
mkdir -p data/unzip
 ./transforms/unzip.sh ./data/download/ ./data/unzip/
mkdir -p data/trim
./transforms/trim.sh ./data/unzip/ ./data/trim/
./transforms/load.sh ./data/trim/
