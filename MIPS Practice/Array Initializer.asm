.data
     myArray: .word 100:3		# Every array element is initialized to 100, 3 elements
     newLine: .asciiz "\n"
.text
     main:
  
    # Clear $t0 to 0
    addi $t0, $zero, 0
                
    while:
          beq $t0, 12, exit		# If value = 12, exit loop (byte allocation == initialized array)
          
          lw $t6, myArray($t0)		# Load first value to t6
          
          addi $t0, $t0, 4		# For every repetition, add 4 to the index
          
          # Print current number
          li $v0, 1
          move $a0, $t6			# Value in t6 is moved to a0
          syscall
          
          # Print new line
          li $v0, 4			# Load string
          la $a0, newLine
          syscall
          
          j while 
          
     
    exit:
         # Tell system end of program
         li $v0, 10
         syscall