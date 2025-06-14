#!/bin/bash
 
if [ $# -ne 1 ]
then
    echo "Usage: $0 <N>"
    exit 1
fi
 
N=$1
 
for ((i=1; i<=$N; i++))
do
    ./process $i &
done
 
wait