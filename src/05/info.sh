#!/bin/bash

get_info() {
    num_folders=`sudo find $1 -mindepth 1 -type d | wc -l`
    # Sh
    top_folders=`sudo du -h $1 | sort -rh | head -5 | cat -n | awk '{print $1" - "$3", "$2}'`
    num_files=`sudo find $1 -type f | wc -l`
    conf_files=`sudo find $1 -type f -name '*.conf' | wc -l`
    txt_files=`sudo find $1 -type f -name '*.txt' | wc -l`
    exe_files=`sudo find $1 -type f -executable | wc -l`
    log_files=`sudo find $1 -type f -name '*.log' | wc -l`
    arc_files=`sudo find $1 -type f -regex '.*\(zip\|rar\|7z\|tar\)' | wc -l`
    links=`sudo find $1 -type l | wc -l`
}
