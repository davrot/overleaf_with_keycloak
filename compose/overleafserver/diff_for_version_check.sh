#!/usr/bin/bash

Version="5.1.1"

# escape
find escape -type f | grep -v ".diff$" > files_to_check.txt
## openid
find openid -type f | grep -v ".diff$" >> files_to_check.txt
## track
find track -type f | grep -v ".diff$" >> files_to_check.txt

find /docker/compose/overleafserver/data/to_mod -type f > found_files_to_compare.txt

for line in $(cat files_to_check.txt)
do
    filename=$(basename "$line")
    path=$(dirname "$line")
    found=$(grep $filename found_files_to_compare.txt) 

    # Check number of matches
    match_count=$(echo "$found" | grep -c .)

    if [ "$match_count" -eq 0 ]; then
        # No match found, optionally log or handle
        echo "Warning: No match found for $filename"
        continue
    elif [ "$match_count" -gt 1 ]; then
        # Multiple matches found
        echo "Alert: Multiple entries found for $filename:"
        echo "$found"
    else
        # Exactly one match
	diff_file="${line}_${Version}.diff"
	diff -u $line $found > $diff_file

    fi
done


rm files_to_check.txt
rm found_files_to_compare.txt
