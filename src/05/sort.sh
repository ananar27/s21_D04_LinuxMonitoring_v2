#!/bin/bash

function sort_response_code() {
    for i in {1..5}; do
        log_file="../04/log_file${i}.log"
        awk '{print $0}' "$log_file" | sort -n -k 8
    done
}

function sort_unique_ip() {
    for i in {1..5}; do
        log_file="../04/log_file${i}.log"
        awk '{print $1}' "$log_file" | sort -u
        done
}

function sort_error_responses() {
    for i in {1..5}; do
        log_file="../04/log_file${i}.log"
        awk '
        {
            if ($8 >= 400) {
                print $0
            }
        }
        ' "$log_file"
    done
}

function sort_unique_ip_error_responses() {
    for i in {1..5}; do
        log_file="../04/log_file${i}.log"
        awk '
        {
            if ($8 >= 400) {
                print $1
            }
        }
        ' "$log_file" | sort -u
    done
}