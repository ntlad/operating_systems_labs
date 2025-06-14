#!/bin/bash
 
# check arguments
if [ $# -ne 5 ]
then
    echo "Usage: $0 <mode> <start_N> <end_N> <repeats> <CPU>"
    echo "  mode: sequential or parallel"
    echo "  start_N: start value N"
    echo "  end_N: end value N"
    echo "  repeats: number of repetitions for each N"
    echo "  CPU: number of CPU"
    exit 1
fi
 
mode=$1
start_N=$2
end_N=$3
repeats=$4
CPU_count=$5
 
output_file="${mode}_results_${CPU_count}.csv"
 
# header CSV file
echo "N,Time" > $output_file
 
for ((N=$start_N; N<=$end_N; N++))
do
    echo "Running N=$N..."
    
    for ((r=1; r<=$repeats; r++))
    do
        # measure execution time
        start_time=$(date +%s.%N)
        
        if [ "$mode" == "sequential" ]
        then
            ./sequential.sh $N > /dev/null
        elif [ "$mode" == "parallel" ]
        then
            ./parallel.sh $N > /dev/null
        else
            echo "Unknown mode: $mode"
            exit 1
        fi
        
        end_time=$(date +%s.%N)
        
        # calculate time in seconds
        runtime=$(echo "$end_time - $start_time" | bc)
        
        # write to file
        echo "$N,$runtime" >> $output_file
    done
done
 
echo "experiment completed, results saved to $output_file"