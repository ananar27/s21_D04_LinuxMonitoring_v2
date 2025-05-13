#!/bin/bash

declare -a response_codes=("200" "201" "400" "401" "403" "404" "500" "501" "502" "503")
declare -a agents=("Mozilla" "Google Chrome" "Opera" "Safari" "Internet Explorer" "Microsoft Edge" "Crawler and bot" "Library and net tool")
declare -a methods=("GET" "POST" "PUT" "PATCH" "DELETE")

for i in {1..5}; do
    file_name="log_file${i}.log"
    count=$(shuf -i 100-1000 -n 1)
    touch "$file_name"
    for ((j=1; j < count; j++)); do
        ip="$(shuf -i 0-255 -n 1).$(shuf -i 0-255 -n 1).$(shuf -i 0-255 -n 1).$(shuf -i 0-255 -n 1)"
        response_code="${response_codes[$((RANDOM % ${#response_codes[@]}))]}"
        method="${methods[$(shuf -i 0-4 -n 1)]}"
        url="example.html"
        agent="${agents[$(shuf -i 0-7 -n 1)]}"
        date="$(date -d "today - ${j} days" "+%d/%m/%Y:%H:%M:%S %z")"
        echo "$ip - $date \"$method $url HTTP/1.1\" ${response_code} \"$agent\"" >> $file_name
    done
done