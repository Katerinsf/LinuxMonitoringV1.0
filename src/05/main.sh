#!/bin/bash

time_1=$(date +%s%N)

chmod +x ./functions.sh
source ./functions.sh


if [[ $# != 1 ]]; then
    echo "Данный скрипт запускается с 1 параметром"
elif [[ ! -d $1 ]]; then
    echo "Директория не найдена"
    echo "Возможно вы забыли поставить /"
else
    print_info $1
    time_2=$(date +%s%N)
    time=`echo "scale=2; ( $time_2 - $time_1 ) / 1000000000"| bc -l`
    echo "Script execution time (in seconds) = $time ms"
fi
