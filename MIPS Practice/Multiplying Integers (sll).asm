.data

.text
     addi $s0, $zero, 4 # add 4 to 0, move to s0
     sll  $t0, $s0, 2 # 2 being the exponent, result stored in t0
     # shift bits to the left, allows multiplication in an efficient manner
     
     #Peint
     li $v0, 1
     add $a0, $zero, $t0 
     syscall