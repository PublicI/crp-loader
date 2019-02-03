#!/bin/bash

set -euo pipefail

for file in $(find $1*.zip); do
    7za x $file -o$2 -y
done
