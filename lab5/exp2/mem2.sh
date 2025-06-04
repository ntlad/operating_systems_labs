#!/bin/bash
 
> report2.log
 
array=()
counter=0
 
echo "mem2.bash started (PID: $$)"
 
while true
do
    array+=({1..10})
    
    ((counter++))
    
    if ((counter % 100000 == 0))
    then
        echo "step $counter: array size = ${#array[@]}" >> report2.log
    fi
done