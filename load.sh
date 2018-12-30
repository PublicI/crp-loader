#!/bin/bash

set -euo pipefail

ARCHIVES="${ARCHIVES:-CampaignFin Expend}"
USERS="${USERS:-redash_default politics}"
CYCLES="${CYCLES:-18 16 14 12 10 08 06 04 02 00}" #  98 96 94 92 90

mkdir -p data
cd data

psql -f ../create.sql
for archive in $ARCHIVES; do
    files=()
    tables=()

    if [ $archive == 'CampaignFin' ]; then
        files=( indivs cmtes pacs pac_other cands )
        tables=( crp_contributions crp_committees crp_comm_to_cand_contributions crp_comm_to_comm_contributions crp_candidates )
    elif [ $archive == 'Expend' ]; then
        files=( expends )
        tables=( crp_expenditures )
    fi

    for table in $tables; do
        for user in $USERS; do
            psql -c "GRANT ALL ON TABLE "$table" TO "$user
        done
    done

    for cycle in $CYCLES; do
        echo $cycle
        wget -N -nv "https://s3.amazonaws.com/assets3.opensecrets.org/bulk-data/"$archive$cycle".zip"

        for i in "${!files[@]}"; do
            file=${files[$i]}
            table=${tables[$i]}
            echo $file" "$table
            7za x $archive$cycle".zip" $file$cycle".txt"
            cat $file$cycle".txt" | node ../trim | psql -c "START TRANSACTION; DELETE FROM "$table" WHERE cycle like '%"$cycle"'; COPY "$table" FROM STDIN; COMMIT TRANSACTION"
            rm  $file$cycle".txt"
        done
    done
done
psql -f ../finish.sql
