.data

.text
  # mul # takes three
  ##   mult # takest wo
  ##  sll # not as flexible as the first two
  
     addi $s0, $zero, 10 # a constant, store 10 in s0
     addi $s1, $zero, 4 # store 4 in s1
     
     mul $t0, $s0, $s1 # get the contents of s0 and s1 (10 and 4), store the product in t0
     
     #Display the product
     li $v0, 1
     add $a0, $zero, $t0 # tell the system to display t0 in a0 
     syscall