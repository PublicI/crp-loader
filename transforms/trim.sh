#!/bin/bash

for file in $(find $1*.csv); do
	cat $file | node trim > $2$(basename $file)
done
