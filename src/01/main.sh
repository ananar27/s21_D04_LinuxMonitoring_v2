#!/bin/bash
source input.sh
source output.sh

# chmod 700 $dir
rm -rf "$dir/report.log" 
touch "$dir/report.log"

for ((i = 0; i < ${folders_nested}; i++)); do
create_folders $i
done
