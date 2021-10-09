.data
     prompt:  .asciiz "Enter your age: "
     message: .asciiz "\nYour age is: "
.text
     # Prompt the user to enter age.
     li $v0, 4 		# Print a string
     la $a0, prompt	# Pass prompt as arg
     syscall
     
     # Get the user input age
     li $v0, 5		# Read integer
     syscall		# Allow to enter int
     
     # Store the result (age) in $t0 
     move $t0, $v0	# The entered value in v0 will be moved to t0 for modification later
     
     # Display message
     li $v0, 4		# Print string
     la $a0, message	# Load message as arg
     syscall
     
     # Print age
     li $v0, 1		# Print int
     move $a0, $t0	# Move the age to argument
     syscall
     