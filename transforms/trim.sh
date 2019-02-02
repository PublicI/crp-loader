#!/bin/bash

for file in $(find $1 -name '*.txt' ! -name '*_Read_Me.txt'); do
	cat $file | node trim > $2$(basename $file)
done
