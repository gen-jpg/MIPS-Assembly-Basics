.data
     message: .asciiz "After while loop is done"
     space: .asciiz "\n"
.text
    main:
         addi $t0, $zero, 0			# i = 0
         
   while:
         bgt $t0, 10, exit			# read as if t0 < 10 
         jal printNumber
         
         addi $t0, $t0, 1			# i++ or i = i + 1
         
         j while				# loop until t0 = 9
   
   
   
   exit:
       li $v0, 4
       la $a0, message
       syscall
       
   # End of program
   li $v0, 10
   syscall
   
   printNumber:
   li $v0, 1
   add $a0, $t0, $zero
   syscall
   
   li $v0, 4
   la $a0, space
   syscall
   
   jr $ra