# $t registers are caller saved
# $s registers are callee saved

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
         
         jal printValue			# Function call 
       
    	 # This line is going to signal end of program
    	 li $v0, 10
    	 syscall
     
     	increaseMyRegister: 		# Stack is a special place in memory, $sp 
 					# It is important to allocate enough stack in order to store the old value
        addi $sp, $sp, -8 		# store 4 bytes, negative bc the stack goes down, (1 VALUE = -4 bytes)
        sw   $s0, 0($sp) 		# Save the value to the first position in sp (has to be a multiple of 4)
        sw   $ra, 4($sp)	
        
        addi $s0, $s0, 30 
        
        # Nested Procedure (a procedure inside a procedure)
        jal printValue			# Function call 
        
        				# Load value in memory, from the register it was before
        
        lw $s0, 0($sp)
        lw $ra, 4($sp)			# Restore old address value in stack
        addi $sp, $sp, 4 		# Restore value in stack by adding 4
        
        jr $ra 				# Return to main function (caller) after execution
    
    printValue:
    	# Print new value in function
        li $v0, 1 
        move $a0, $s0
        syscall
        
        jr $ra 				# Return to caller
        				# When adding, you take space from the stack
        				# When subtracting, you are allocating space
        