#!/bin/bash

set -euo pipefail

CYCLES="${CYCLES:-18 16 14 12 10 08 06 04 02 00}" #  98 96 94 92 90

psql -f create.sql
for cycle in $CYCLES; do
    echo $cycle
    wget -N -nv "https://s3.amazonaws.com/assets3.opensecrets.org/bulk-data/Expend"$cycle".zip"
    7za x "Expend"$cycle".zip" "expends"$cycle".txt"
    psql -c "COPY crp_expenditures FROM STDIN WITH CSV QUOTE '|' ENCODING 'LATIN1'" < "expends"$cycle".txt"
    rm *.txt
done
psql -f finish.sql
