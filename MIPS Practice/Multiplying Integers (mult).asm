.data

.text
     addi $t0, $zero, 2000 # t0 has the value of 2000 (2000- 0)
     addi $t1, $zero, 10 # t1 has the value of 10
     
     mult $t0, $t1 # sends to lo and hi registers, product is stored in two registers 
     
     mflo $s0 # the product of the multiplication is moved to s0
     
     #Display the product to the screen
     li $v0, 1
     add $a0, $zero, $s0 # print an int to the screen, the one stored in s0
     syscall
