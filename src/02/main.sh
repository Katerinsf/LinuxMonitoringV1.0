#!/bin/bash

source ./output.sh

if [ $# != 0 ]; then
    # echo "Invalid parameters"
    echo "This script is run without parameters"
else
    print_info
    read -p "Do you want to save the data in a file? (Y/N):" answer
    if [[ $answer == Y ]] || [[ $answer == y ]]; then
        filename="$(date +"%d_%m_%y_%H_%M_%S").status"
        print_info >> $filename
        # print_info | sudo dd of=${filename}
        echo "File saved!"
    else
        echo "File not saved!"
    fi
fi
