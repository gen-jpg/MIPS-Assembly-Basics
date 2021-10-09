.data
     message:   .asciiz "True. \n"
     message1:  .asciiz "This is false. \n"
     num1:      .float 10.4
     num2:      .float 4.6
.text
     main:
     	  lwc1 $f0, num1			# Store value of num1 in f0
     	  lwc1 $f2, num2			# Store value of num2 in f2
     	  
     	  c.eq.s $f0, $f2			# Compare f0 with f2, check if equal
     	  
     	  bc1t exit				# If true, jump to exit
     	  
     	  
     	  # Jump here if false
     	  li $v0, 4
     	  la $a0, message1
     	  syscall
     
     	  li $v0, 10					# End program
          syscall
          
     exit:
    	  li $v0, 4					# Display text
    	  la $a0, message
    	  syscall
    	 