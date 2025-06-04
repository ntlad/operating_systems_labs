#!/bin/bash

{
    echo "last 2 notes in dmesg:"
    dmesg | grep "mem.sh" | tail -n 2
    echo "" 
} >> report.log
