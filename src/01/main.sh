#!/bin/bash

reg='^[+-]?[0-9]+([.][0-9]+)?$'

if [ $# != 1 ] || [[ $1 =~ $reg ]]
then
    echo "Invalid parameters"
else
    echo $1
fi