#!/bin/bash

psql -f $(dirname "$BASH_SOURCE")/create.sql

indivs=crp_contributions
cmtes=crp_committees
pacs=crp_comm_to_cand_contributions
pac_other=crp_comm_to_comm_contributions
cands=crp_candidates
expends=crp_expenditures

for file in $(find $1*.txt); do
    base=$(basename $file .txt)
    type=$(echo $base | tr -d '0-9')
    table=${!type}
    cycle=$(echo $base | tr -dc '0-9')

    psql -c "START TRANSACTION;

    DELETE
    FROM "$table"
    WHERE cycle like '%"$cycle"';

    COPY "$table"
    FROM STDIN;

    COMMIT TRANSACTION;" < $file
done
