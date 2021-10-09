.data
     message: .asciiz "The number is less than the other."
.text
    main:
    addi $t0, $zero, 1
    addi $t1, $zero, 200

    slt $s0, $t0, $t1							# if 1st < 2nd = 1, otherwise 0 (s0)
    bne $s0, $zero, printMessage					# If s0 = 1, proceed to printMessage
    
    # End of program
    li $v0, 10
    syscall
    
    printMessage:
    	li $v0, 4
    	la $a0, message
    	syscall
    	
    
    