#!/bin/bash

set -euo pipefail

ARCHIVES="${ARCHIVES:-CampaignFin Expend}"
CYCLES="${CYCLES:-18 16 14 12 10 08 06 04 02 00}" #  98 96 94 92 90

for archive in $ARCHIVES; do
    for cycle in $CYCLES; do
        aws s3api head-object --bucket assets3.opensecrets.org --key "bulk-data/"$archive$cycle".zip" --no-sign-request --query '{Length:ContentLength,ETag:ETag}' > $1$archive$cycle".zip"
    done
done
