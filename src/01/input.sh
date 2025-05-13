#!/bin/bash

dir=$1
folders_nested=$2
folders_naming=$3
files_amount=$4
files_naming=$5
file_size=$6


# Настроим считывание ввода через точку
IFS='.' read -a array_fi <<< $files_naming

#  Проверим на соответствие количеству параметров
if [[ "$#" -ne 6 ]]; then
    echo -e "Error: wrong number of parameters\n"
    exit 1
fi 

# Проверим существование  директории ($1)
if ! [[ -d $dir ]]; then
    echo -e "Error: folder not found\n"
    exit 1
fi
dir=$(realpath $dir)

# Проверим корректность ввода уровня вложенности директории ($2)
if [[ "$folders_nested" =~ [^0-9]+ ]]; then
    echo -e "Error: parametr "$2" you are trying to pass is not a numeral\n"
    exit 1
fi

# Проверим корректность ввода названия директории ($3)
if [[ "$folders_naming" =~ [^a-zA-Z]+ ]]; then
    echo -e "Error: parametr "$3" is invalid, try using only letters\n"
    exit 1
fi

if [[ ${#folders_naming} -gt "7" ]]; then
    echo -e "Error: parametr "$3" is invalid, try using no more than 7 symbols\n"
    exit 1
fi

# Проверим корректность ввода количества генерируемых файлов ($4)
if [[ "$files_amount" =~ [^0-9]+ ]]; then
    echo -e "Error: parametr "$4" you are trying to pass is not a numeral\n"
    exit 1
fi

# Проверим корректность ввода названия файлов ($5)
if ! [[ "$files_naming" =~ ^[a-zA-Z]{1,7}\.[a-zA-Z]{1,3}$ ]]; then
    echo -e "Error: parametr "$files_naming" is invalid, try using only letters\n"
    exit 1
fi

# Проверим корректность ввода размера файлов ($6)

if [[ ! "$file_size" =~ ^^[1-9][0-9]?kb$|^100kb$ ]] ; then
    echo -e "Error: Invalid parameters: "$6""
    exit 1
else
    file_size=${file_size%?}
fi