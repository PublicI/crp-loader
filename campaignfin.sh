#!/bin/bash

psql -U politics -h db.fivetwentyseven.com -c "TRUNCATE crp_contributions;" politics
for cycle in 18 16 14 12; do
    echo $cycle
    wget -N "https://s3.amazonaws.com/assets3.opensecrets.org/bulk-data/CampaignFin"$cycle".zip"
    7za x "CampaignFin"$cycle".zip" "indivs"$cycle".txt"
    psql -U politics -h db.fivetwentyseven.com -c "COPY crp_contributions FROM STDIN WITH CSV QUOTE '|' ENCODING 'LATIN1'" < "indivs"$cycle".txt" politics
    psql -U politics -h db.fivetwentyseven.com -c "UPDATE crp_contributions SET type = trim(type);" politics
    rm *.txt
done
