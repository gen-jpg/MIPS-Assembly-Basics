# Doubles take up 2 registers since they have 64 bits of data
# Floats and doubles uses $f registers

.data
     prompt:  .asciiz "Enter the value of e: " 
     
.text
    # Display message to user
    li $v0, 4				# Display string
    la $a0, prompt
    syscall
    
    # Get the double from user
    li $v0, 7				# Read double
    syscall
    
    # Display user input
    li       $v0, 3			#  Display double
    add.d    $f12, $f0, $f10		# store value in $f12 
    syscall
    
    