.data

.text
     addi $t0, $zero, 30 # 30 stored in t0
     addi $t1, $zero, 5 # 5 stored in t1
     
     div $s0, $t0, $t1 # (t0/t1), store value in s0
     
     #Print
     li $v0, 1 # print out int
     add $a0, $zero, $s0 # move to a0
     syscall