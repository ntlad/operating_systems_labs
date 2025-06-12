#!/bin/bash
 
if [ -z "$1" ]
then
    echo "Usage: $0 <N>"
    exit 1
fi
 
N=$1
array=()
counter=0
 
while true
do
    array+=({1..10})
    ((counter++))
    
    current_size=${#array[@]}
    if (( current_size > N ))
    then
        exit 0
    fi
done