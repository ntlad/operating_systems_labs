#!/bin/bash
 
> report.log
 
array=()
counter=0
 
echo "mem.sh started (PID: $$)"
 
while true
do
    array+=({1..10})
    
    ((counter++))
    
    if ((counter % 100000 == 0))
    then
        echo "step $counter: array size = ${#array[@]}" >> report.log
    fi
done

echo "process mem.sh killed" >> report.log

