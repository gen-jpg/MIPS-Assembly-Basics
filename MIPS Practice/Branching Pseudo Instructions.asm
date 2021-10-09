.data
     message:  .asciiz "Hi, how are you?"
     message1: .asciiz "Are you doing okay?"
.text
     main:
     addi $s0, $zero, 9
     addi $s1, $zero, 10
     
     blt $s0, $s1, displayLo
     bgt $s0, $s1, displayHi		 # Pseudo Instruction (translates your code into its equivalent
     
     # End of program
     li $v0,10
     syscall
     
     displayHi:				 # Print if s0 > s1
     	li $v0, 4
     	la $a0, message
     	syscall
     	
     displayLo:				# Print if s0 < s1
     	li $v0, 4
     	la $a0, message1
     	syscall