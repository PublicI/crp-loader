#!/bin/bash

psql -U politics -h db.fivetwentyseven.com -c "TRUNCATE crp_contributions;" politics
for cycle in 18 16 14 12; do
	echo $cycle
	wget -N "https://s3.amazonaws.com/assets3.opensecrets.org/bulk-data/CampaignFin"$cycle".zip"
	unzip "CampaignFin"$cycle".zip"
	psql -U politics -h db.fivetwentyseven.com -c "COPY crp_contributions FROM STDIN" < "indivs"$cycle".txt" politics
	rm *.txt
done
