.data # store two values in RAM
     number1: .word 20
     number2: .word 8
.text
    lw $s0, number1 # s0 = num1 (20); functions aren't allowed to modify registers like s0
    lw $s1, number2 # s1 = num2 (8)
    
    sub $t0, $s0, $s1 # t0 = s0 - s1 (20 -8)
    
    li $v0, 1 # print int
    move $a0, $t0 # move value from t0 to a0, this is to let the system know what is to be printed out
    syscall 