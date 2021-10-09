## C Lanugage while loop to search an array of n integers linearly for a given
## target value

## int i = 0;
## while (arr[i] != target && i < n) i = i+1;

# Given that $a0 = &arr, $a1 = target, it is translated to

move $t0, $a0			# t0 = address of arr
li   $t1, 0			# t1 = index i = 0

while:
lw   $t2, 0($t0)		# t2 = arr[i]
beq  $t2, $a2, next		# branch if (arr[i] == target) to label next
beq  $t1, $a1, next		# branch if (i == n) to label next
addi $t1, $t1, 1		# i = i+1 (i+=1)
sll  $t3, $t1, 2		# t3 = i x 4 // shifts left i by 2 bits
add  $t0, $a0, $t3		# t0 = &arr + i x 4 = &arr[i]
j    while			# jump to while loop

next: 

## However, one can point to the next array element by incrementing the
## address in $t0 by 4. Using a pointer to traverse is faster than computing

while:
lw   $t2, 0($t0)		# t2 = arr[i]
beq  $t2, $a2, next		# branch if (arr[i] == target) to label next
beq  $t1, $a1, next		# branch if (i == n) to label next
addi $t1, $t1, 1		# i = i+1 (i+=1)
addi $t0, $t0, 4		# t0 = &arr[i]
j    while			# jump to while loop

