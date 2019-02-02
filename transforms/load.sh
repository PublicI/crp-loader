#!/bin/bash

# psql -f create.sql

for file in $(find $1*.csv); do
	echo $file
    #base=$(basename $f .csv)
    #year=${base#index_};

    # psql -c "START TRANSACTION;

    # DELETE
    # FROM irs990_filings_meta
    # WHERE cycle = '"$cycle"';

    # COPY irs990_filings_meta
    # FROM STDIN CSV HEADER;

    # COMMIT TRANSACTION;" < $f
done
