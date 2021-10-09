# Write a MIPS program that executes the statement: s = (a + b) – (c + 101), where a, b, and c are
# user provided integer inputs, and s is computed and printed as an output.

################# Data segment #####################
.data
	prompt1: 	.asciiz "\nInput A: "
	prompt2: 	.asciiz "\nInput B: "
	prompt3: 	.asciiz "\nInput C: "
	outputMessage:	.asciiz "s = "
	.globl main
################# Code segment #####################

.text
main:				#main program of entry

	li $v0, 4		# Print string
	la $a0, prompt1		# Take prompt1 (a) as argument, place value in a0
	syscall
	
	li $v0,5		# Read integer
	syscall 
	move $t1, $v0		# Ask for user input, move value placed in v0 to t1
	
	li $v0, 4		# Print string
	la $a0, prompt2 	# Take prompt2 (b) as argument
	syscall 
	
	li $v0, 5		# Read integer
	syscall 		
	move $t2, $v0		# Move value

	li $v0, 4
	la $a0, prompt3		# Take prompt3 (c) as argument, place value in a0
	syscall
	
	li $v0, 5		# Read integer 
	syscall
	move $t3, $v0
	

	add $a0, $t1, $t2 	# Get a + b
	add $a0, $t3, 101 	# Get c - 101
	sub $t0, $a0, $a0 	# (a + b) - (c + 101)
	
	
   	li    $v0, 4
   	la    $a0, outputMessage		# output arithmetic message
   	syscall
   	
   	li    $v0, 1
   	move $a0, $t0
   	syscall
	
	
	li $v0, 1		# Exit program
	syscall