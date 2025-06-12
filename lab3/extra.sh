#!/bin/bash
 
generate_random() {
    echo $((RANDOM % 10000 + 2))
}
 
p=23  # small prime number
q=5  
 
echo "Parameters: p=$p, q=$q"
 
# process A:
a=$(generate_random)
A=$(echo "($q ^ $a) % $p" | bc)
echo "process A: generated a=$a, sent A=$A"
 
# process B:
b=$(generate_random)
B=$(echo "($q ^ $b) % $p" | bc)
echo "process B: generated b=$b, sent B=$B"
 
# exchange values A and B
# both processes can calculate K
 
# process A calculates K = B^a mod p
K_A=$(echo "($B ^ $a) % $p" | bc)
 
# process B calculates K = A^b mod p
K_B=$(echo "($A ^ $b) % $p" | bc)
 
echo "process A calculated K=$K_A"
echo "process B calculated K=$K_B"
 
# check that the keys match 
if [ "$K_A" -eq "$K_B" ]
then
    echo "reys matched, key = $K_A"
else
    echo "error, keys didn't match"
fi