#!/bin/bash

set -euo pipefail

for file in $(find $1*.zip); do
    aws s3 cp s3://assets3.opensecrets.org/bulk-data/$(basename $file) $2  --no-sign-request
done
