#!/bin/bash

for file in $(find $1*.zip); do
	7za x $archive$cycle".zip" -o $2
done
