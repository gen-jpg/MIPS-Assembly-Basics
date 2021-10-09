.data
     myArray: .space 12			# 4 bytes = 1 int 
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
        addi $t0, $t0, 4		# Allocate 4 bytes
        
    lw $t6, myArray($zero)		# Retrieve value from myArray
    
    li $v0, 1
    addi $a0, $t6, 0
    syscall
     