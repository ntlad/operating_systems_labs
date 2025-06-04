#!/bin/bash

> dop_report.txt
 
# function for check if mem.sh exist
is_mem_running() {
    pgrep -f "mem.sh" > /dev/null
}
 
echo "waiting mem.sh..." | tee -a dop_report.txt
 
# wait start mem.sh
while ! is_mem_running
do
    sleep 1
done 

while is_mem_running
do
    {
        echo "=========================================="
        date
        echo "general memory stat:"
        top -b -n 1 | head -n 5
        echo "info about process mem.sh:"
        top -b -n 1 | grep -E "mem.sh|PID"
        echo ""
    } >> dop_report.txt
    
    sleep 1
done
