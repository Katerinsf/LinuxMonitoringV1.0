#!/bin/bash

source ./info.sh

print_info() {
    get_info $1
    printf "Total number of folders (including all nested ones) = $num_folders\n"
    printf "TOP 5 folders of maximum size arranged in descending order:\n$top_folders\n"
    printf "Total number of files = $num_files\n"
    printf "Number of:\n"
    printf "Configuration files = $conf_files\n"
    printf "Text files = $txt_files\n"
    printf "Executable files = $exe_files\n"
    printf "Log files = $log_files\n"
    printf "Archive files = $arc_files\n"
    printf "Symbolic links = $links\n"
    printf "TOP 10 files of maximum size arranged in descending order:\n"
    top10_files $1
    printf "TOP 10 executable files of the maximum size arranged in descending order:\n"
    top10_exe_files $1
}

top10_files() {
    top=`sudo find $1 -type f -exec du -h {} + | sort -rh | head -10`
    n=`sudo find $1 -type f -exec du -h {} + | sort -rh | head -10 | wc -l`
    i=0
    while [ $i != $n ]
    do
        j=$(( $i + 1 ))
        path=`printf "$top\n" | awk '{print $2}' | awk "NR==$j"`
        size=`printf "$top\n" | awk '{print $1}' | awk "NR==$j"`            
        type=`echo $path | grep -m 1 -o -E "\.[^/.]+$" | awk -F . '{print $2}'`

        printf "$j - $path, $size, $type\n"
        i=$(( $i + 1 ))
    done

}

top10_exe_files() {
    top=`sudo find $1 -type f -exec du -h {} + | sort -rh | head -10`
    n=`sudo find $1 -type f -exec du -h {} + | sort -rh | head -10 | wc -l`
    # printf "$top\n"
    # printf "$n\n"
    i=0
    while [ $i != $n ]
    do
        j=$(( $i + 1 ))
        path=`printf "$top\n" | awk '{print $2}' | awk "NR==$j"`
        size=`printf "$top\n" | awk '{print $1}' | awk "NR==$j"`            
        md=`md5sum $path | awk '{print $1}'`

        printf "$j - $path, $size, $md\n"
        i=$(( $i + 1 ))
    done

}




