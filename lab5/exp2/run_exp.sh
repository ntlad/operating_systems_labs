#!/bin/bash
 
./mem.sh & pid1=$!
./mem2.sh & pid2=$!
 
echo "processes started: mem.sh (PID: $pid1) and mem2.sh (PID: $pid2)"
 
wait $pid1 $pid2
 
echo "both processes finished"