#!/bin/bash

if [[ $# != 0 ]]; then
	echo "Error: Invalid number of arguments (should be 0)"
else 
	goaccess -f ../04/*.log --log-format='%h - %[%d:%t %^] "%r" %3s "%u"' --date-format='%d/%m/%Y' --time-format='%H:%M:%S %Z' -a > ./report.html
fi