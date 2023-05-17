#!/bin/bash

chmod +x info.sh
chmod +x colors.sh
source ./info.sh
source ./colors.sh

print_info() {
    printf "${1}${2}HOSTNAME = ${3}${4}$HOSTNAME\n${reset}"
    printf "${1}${2}TIMEZONE = ${3}${4}$TIMEZONE\n${reset}"
    printf "${1}${2}USER = ${3}${4}$USER\n${reset}"
    printf "${1}${2}OS = ${3}${4}$OS\n${reset}"
    printf "${1}${2}DATE = ${3}${4}$DATE\n${reset}"
    printf "${1}${2}UPTIME = ${3}${4}$UPTIME\n${reset}"
    printf "${1}${2}UPTIME_SEC = ${3}${4}$UPTIME_SEC\n${reset}"
    printf "${1}${2}IP = ${3}${4}$IP\n${reset}"
    printf "${1}${2}MASK = ${3}${4}$MASK\n${reset}"
    printf "${1}${2}GATEWAY = ${3}${4}$GATEWAY\n${reset}"
    printf "${1}${2}RAM_TOTAL = ${3}${4}$RAM_TOTAL\n${reset}"
    printf "${1}${2}RAM_USED = ${3}${4}$RAM_USED\n${reset}"
    printf "${1}${2}RAM_FREE = ${3}${4}$RAM_FREE\n${reset}"
    printf "${1}${2}SPACE_ROOT = ${3}${4}$SPACE_ROOT\n${reset}"
    printf "${1}${2}SPACE_ROOT_USED = ${3}${4}$SPACE_ROOT_USED\n${reset}"
    printf "${1}${2}SPACE_ROOT_FREE = ${3}${4}$SPACE_ROOT_FREE\n${reset}"
}

check_colors() {
    reg='[1-6]'
    repeat="Попробуй повторить ввод!"

    if [[ $5 != 4 ]]; then
        echo -e "Увы, необходимо 4 параметра\n$repeat"
    elif [[ $1 != $reg ]] || [[ $2 != $reg ]] || [[ $3 != $reg ]] || [[ $4 != $reg ]]; then
        echo -e "Выбери параметры в интервале [1, 6]\n$repeat"
    elif [[ $1 == $2 ]] || [[ $3 == $4 ]]; then
        echo -e "Фон и шрифт должны быть разными\n$repeat"
    else
        return 1
    fi
}

color_font() {
    case $1 in
        1) echo "$white_f";;
        2) echo "$red_f";;
        3) echo "$green_f";;
        4) echo "$blue_f";;
        5) echo "$purple_f";;
        6) echo "$black_f";;
        *) echo "$reset";;
    esac
}

color_back() {
    case $1 in
        1) echo "$white_b";;
        2) echo "$red_b";;
        3) echo "$green_b";;
        4) echo "$blue_b";;
        5) echo "$purple_b";;
        6) echo "$black_b";;
        *) echo "$reset";;
    esac
}
