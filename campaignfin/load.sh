#!/bin/bash

set -euo pipefail

CYCLES="${CYCLES:-18 16 14 12 10 08 06 04 02 00}" #  98 96 94 92 90

psql -f create.sql
for cycle in $CYCLES; do
    echo $cycle
    wget -N -nv "https://s3.amazonaws.com/assets3.opensecrets.org/bulk-data/CampaignFin"$cycle".zip"
    7za x "CampaignFin"$cycle".zip" "indivs"$cycle".txt"
    psql -c "COPY crp_contributions FROM STDIN WITH CSV QUOTE '|' ENCODING 'LATIN1'" < "indivs"$cycle".txt"
    rm  "indivs"$cycle".txt"
    7za x "CampaignFin"$cycle".zip" "cmtes"$cycle".txt"
    psql -c "COPY crp_committees FROM STDIN WITH CSV QUOTE '|' ENCODING 'LATIN1'" < "cmtes"$cycle".txt"
    rm  "cmtes"$cycle".txt"
    7za x "CampaignFin"$cycle".zip" "pacs"$cycle".txt"
    psql -c "COPY crp_comm_to_cand_contributions FROM STDIN WITH CSV QUOTE '|' ENCODING 'LATIN1'" < "pacs"$cycle".txt"
    rm  "pacs"$cycle".txt"
    7za x "CampaignFin"$cycle".zip" "pac_other"$cycle".txt"
    psql -c "COPY crp_comm_to_comm_contributions FROM STDIN WITH CSV QUOTE '|' ENCODING 'LATIN1'" < "pac_other"$cycle".txt"
    rm  "pac_other"$cycle".txt"
    7za x "CampaignFin"$cycle".zip" "cands"$cycle".txt"
    psql -c "COPY crp_candidates FROM STDIN WITH CSV QUOTE '|' ENCODING 'LATIN1'" < "cands"$cycle".txt"
    rm  "cands"$cycle".txt"
done
psql -f finish.sql
