#!/bin/bash

psql -U politics -h db.fivetwentyseven.com -f campaignfin.sql politics
for cycle in 18 16 14 12 10 08 06 04 02 00; do #  98 96 94 92 90
    echo $cycle
    wget -N "https://s3.amazonaws.com/assets3.opensecrets.org/bulk-data/CampaignFin"$cycle".zip"
    7za x "CampaignFin"$cycle".zip" "indivs"$cycle".txt"
    psql -U politics -h db.fivetwentyseven.com -c "COPY crp_contributions FROM STDIN WITH CSV QUOTE '|' ENCODING 'LATIN1'" < "indivs"$cycle".txt" politics
    rm  "indivs"$cycle".txt"
    7za x "CampaignFin"$cycle".zip" "cmtes"$cycle".txt"
    psql -U politics -h db.fivetwentyseven.com -c "COPY crp_committees FROM STDIN WITH CSV QUOTE '|' ENCODING 'LATIN1'" < "cmtes"$cycle".txt" politics
    rm  "cmtes"$cycle".txt"
done
psql -U politics -h db.fivetwentyseven.com -f campaignfin-finish.sql politics
