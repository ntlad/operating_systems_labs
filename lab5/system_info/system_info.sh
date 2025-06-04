#!/bin/bash
 
output="system_config.txt"
 
> "$output"
 
mem_total=$(grep MemTotal /proc/meminfo | awk '{print $2}')
mem_free=$(grep MemFree /proc/meminfo | awk '{print $2}')
mem_available=$(grep MemAvailable /proc/meminfo | awk '{print $2}')
swap_total=$(grep SwapTotal /proc/meminfo | awk '{print $2}')
swap_free=$(grep SwapFree /proc/meminfo | awk '{print $2}')
 
swap_total_MB=$((swap_total / 1024))
swap_total_GB=$((swap_total / 1048576))
free_mem_MB=$((mem_available / 1024))
 
page_size=$(getconf PAGE_SIZE)
 
echo "1. Total RAM size:" >> "$output"
echo "  $mem_total KB" >> "$output"
echo "" >> "$output"
 
echo "2. Swap space size:" >> "$output"
echo "  Total: $swap_total KB ($swap_total_MB MB, $swap_total_GB GB)" >> "$output"
echo "" >> "$output"
 
echo "3. Virtual memory page size:" >> "$output"
echo "  $page_size B" >> "$output"
echo "" >> "$output"
 
echo "4. The amount of free physical memory:" >> "$output"
echo "  $free_mem_MB MB" >> "$output"
echo "" >> "$output"
 
echo "5. Free swap space size:" >> "$output"
echo "  $swap_free KB" >> "$output"
