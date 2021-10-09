.data
     message:   .asciiz "The numbers are equal. "
     message2:  .asciiz "Nothing happened. :"
     
.text
     main:
         addi $t0, $zero, 5
         addi $t1, $zero, 20
         
         # Check if t0 and t1 are equal
         beq $t0, $t1, numbersEqual 		# numbersEqual is a label, if ==, proceed to numbersEqual
         bne $t0, $t1, numbersDifferent
     
     
    	 # Exit program
     	li $v0, 10
     	syscall
     
     numbersEqual:
        li $v0, 4
        la $a0, message
        syscall
        
     numbersDifferent:
     	li $v0, 4
     	la $a0, message2
     	syscall
       