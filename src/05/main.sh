#!/bin/bash

source sort.sh
option="$1"

if [[ option -eq 1 ]]; then
    sort_response_code
elif [[ option -eq 2 ]]; then
    sort_unique_ip
elif [[ option -eq 3 ]]; then
    sort_error_responses
elif [[ option -eq 4 ]]; then
    sort_unique_ip_error_responses
elif [[ option -gt 4 || $# -ne 1 ]]; then
    echo "Invalid input. Try using options 1-4."
    exit 1
fi