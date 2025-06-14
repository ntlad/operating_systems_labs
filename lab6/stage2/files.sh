#!/bin/bash


for i in {1..20}
do 
    dd if=/dev/urandom of=file_$i.bin bs=1M count=4
done 
