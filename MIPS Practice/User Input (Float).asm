.data
     message: 	  .asciiz 		"Enter the value of PI: "
     zeroAsFloat: .float 0.0
     # we do not have default for 0 registers
.text
     lwc1 $f4, zeroAsFloat		# Assign as constant (contain 0 as float)
     
     # Display message
     li $v0, 4				# Display text
     la $a0, message
     syscall
     
     # Read user input
     li $v0, 6				# Read float
     syscall				# Store in f0, (floats and doubles use f registers)
     
     # Display the value
     li      $v0, 2				# Display float
     add.s   $f12, $f0, $f4			# f12 is the argument, value is stored in f12 (f0 + f4)
     syscall
     
     