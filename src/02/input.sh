#!/bin/bash

function check_args() {

folders_naming=$1
files_naming=$2
file_size=$3

IFS='.' read -a array_fi <<< $files_naming

#  Проверим ввод на количество параметров
if [[ $# -ne "3" ]]; then
    echo -e "Error: wrong number of parameters. The correct number of parameters is 3\n"
    exit 1
fi

# Проверим длинну строки символов для генерации названия директорий ($1)
if [[ ${#folders_naming} -gt "7" ]]; then
    echo -e "Error: parametr "$1" you are trying to pass is too long\n"
    exit 1
fi

if [[ "$folders_naming" =~ [^a-zA-Z]+ ]]; then
    echo -e "Error: parametr "$1" you are trying to pass is invalid, try using only letters\n"
    exit 1
fi

# Проверим соответствие строки символов для генерации названия файлов ($2)
if ! [[ "$files_naming" =~ ^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$ ]]; then
    echo -e "Error: parametr "$2" is invalid, try using only letters\n"
    exit 1
fi

# Проверим корректность ввода размера файлов ($3)
if ! [[ "$file_size" =~ ^^[1-9][0-9]?Mb$|^100Mb$ ]]; then
    echo -e "Error: Invalid parameter: "$3""
    exit 1
else
    file_size=${file_size%?}
fi
}