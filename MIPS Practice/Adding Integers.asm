.data #these are stored in RAM
     number1: .word 5
     number2: .word 10
.text #move them to the processor 
     lw $t0, number1($zero) 
     lw $t1, number2($zero)
     
     add $t2, $t0, $t1 # t2 = t0 + t1, sum will be stored in t2
     
     li $v0, 1 # print integer
     add $a0, $zero, $t2 # print the value stored in t2, move to a0
     syscall
     
