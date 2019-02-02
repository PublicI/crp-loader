#!/bin/bash

for file in $(find $1*.zip); do
	7za x $file -o $2
done
