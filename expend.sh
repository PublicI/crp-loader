#!/bin/bash

psql -U politics -h db.fivetwentyseven.com -f expend.sql politics
for cycle in 18 16 14 12 10 08 06 04 02 00; do
    echo $cycle
    wget -N "https://s3.amazonaws.com/assets3.opensecrets.org/bulk-data/Expend"$cycle".zip"
    https://s3.amazonaws.com/assets3.opensecrets.org/bulk-data/CampaignFin90.zip
    7za x "Expend"$cycle".zip" "expends"$cycle".txt"
    psql -U politics -h db.fivetwentyseven.com -c "COPY crp_expenditures FROM STDIN WITH CSV QUOTE '|' ENCODING 'LATIN1'" < "expends"$cycle".txt" politics
    # psql -U politics -h db.fivetwentyseven.com -c "UPDATE crp_contributions SET type = trim(type);" politics
    rm *.txt
done
