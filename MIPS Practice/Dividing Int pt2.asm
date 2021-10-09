.data

.text
     addi $t0, $zero, 30 # 30 stored in t0
     addi $t1, $zero, 8 # 5 stored in t1
     
     div $t0, $t1, # quotient in lo, remainder in hi
     
     mflo $s0 # s0 has the quotient
     mfhi $s1 # s1 has the remainder
     
     #Print
     li $v0, 1 # print out int
     add $a0, $zero, $s0 # move to a0
     syscall