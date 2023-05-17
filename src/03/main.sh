#!/bin/bash

chmod +x functions.sh
source ./functions.sh

check_colors $1 $2 $3 $4 $#
if [[ $? == 1 ]]; then
    b_right=$(color_back $1)
    f_right=$(color_font $2)
    b_left=$(color_back $3)
    f_left=$(color_font $4)
    print_info $b_right $f_right $b_left $f_left 
fi

