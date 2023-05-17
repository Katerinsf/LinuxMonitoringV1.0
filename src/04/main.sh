#!/bin/bash

chmod +x ./functions.sh
# chmod +x ./colors.conf
source ./functions.sh
source ./colors.conf

check_colors $# $column1_background $column1_font_color $column2_background $column2_font_color

# 1 - всё ок; 2 - цвета по дефолту
if [[ $? == 1 || $? == 2 ]]; then
    b_right=$(color_back $column1_background)
    f_right=$(color_font $column1_font_color)
    b_left=$(color_back $column2_background)
    f_left=$(color_font $column2_font_color)

    print_info $b_right $f_right $b_left $f_left
    message_color $column1_background $column1_font_color $column2_background $column2_font_color
fi
