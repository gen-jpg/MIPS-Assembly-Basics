.data
     newLine: .asciiz "\n" # New line
.text 
	# By convention, when using $s registers you should save them in stacks
	# We want the old value to be back after function execution 

     main:      			# Value in s registers can't be modified by the function
         add $s0, $zero, 10 		# 10 is stored in s0
         
         jal increaseMyRegister		# Call a funtion
         
         # Print new line
         li $v0, 4
         la $a0, newLine
         syscall
         
         #Print value
         li $v0, 1 			# Print int
         move $a0, $s0 			# Pass s0 as arg, move to a0 to be called
         syscall
         
     
    	 # This line is going to signal end of program
    	 li $v0, 10
    	 syscall
     
     	increaseMyRegister: 		# Stack is a special place in memory, $sp 
       					# It is important to allocate enough stack in order to store the old value
        addi $sp, $sp, -4 		# store 4 bytes, negative bc the stack goes down, (1 element = -4 bytes)
        sw   $s0, 0($sp) 		# Save the value to the first position in sp (has to be a multiple of 4)
        
        addi $s0, $s0, 30 
        
        # Print new value in function
        
        li $v0, 1 
        move $a0, $s0
        syscall
        
        # Load value in memory, from the register it was before
        
        lw $s0, 0($sp)
        addi $sp, $sp, 4 		# Restore value in stack by adding 4
        
        jr $ra 				# Return to main function (caller) after execution
        
        				# When adding, you take space from the stack
        				# When subtracting, you are allocating space
        