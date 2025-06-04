#!/bin/bash
 
> dop_report.txt
 
are_scripts_running() {
    pgrep -f "mem.sh" > /dev/null || pgrep -f "mem2.sh" > /dev/null
}
 
echo "waiting mem.bash and mem2.bash..." | tee -a dop_report.txt
 
while ! are_scripts_running
do
    sleep 1
done
 
 
while are_scripts_running
do
    {
        echo "=========================================="
        date
        echo "general memory stat:"
        top -b -n 1 | head -n 5
        echo "info about processes"
        top -b -n 1 | grep -E "mem[2]*.sh|PID"
        echo "current array size:"
        echo "  mem.sh: $(tail -n 1 report.log 2>/dev/null || echo 'empty file')"
        echo "  mem2.sh: $(tail -n 1 report2.log 2>/dev/null || echo 'empty file')"
        echo ""
    } >> dop_report.txt
    sleep 1
done

{
    echo "last notes in dmesg:"
    dmesg | grep -E "mem[2]*.sh" | tail -n 5
    echo ""
} >> dop_report.txt
