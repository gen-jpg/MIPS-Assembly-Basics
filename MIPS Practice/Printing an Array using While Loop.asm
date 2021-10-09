.data
     myArray: .space 12			# 4 bytes = 1 int, Array Declaration
     newLine: .asciiz "\n"
.text
     addi $s0, $zero, 4
     addi $s1, $zero, 10
     addi $s2, $zero, 12
     
     # Index = $t0
     addi $t0, $zero, 0			# clear t0 
     
     sw $s0, myArray($t0)
        addi $t0, $t0, 4		# Allocate 4 bytes
     sw $s1, myArray($t0)
        addi $t0, $t0, 4		# Allocate 4 bytes
     sw $s2, myArray($t0)
    
        
    # Clear $t0 to 0
    addi $t0, $zero, 0
                
    while:
          beq $t0, 12, exit		# If value = 12, exit loop
          
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