# Title:  CH7 LAB TASK 4 		Filename: CH7 LAB TASK 4 - MACRAYO.asm
# Author: Genevive S. Macrayo		Date: JANUARY 7, 2021
# Description: Write a function that reverses the elements of an array of n integers. The function reverse
#	       must receive two arguments: $a0 = address of the array, and $a1 = number n of elements.
# Input:  n (number of elements to be read and printed)
# Output: Reverse order of the array of integers.

################# Data segment #####################
.data
	prompt:		.asciiz "Input number of elements to be read: "
	reverseMsg:	.asciiz "Reverse of the array:"
			.align 2
	newLine:	.asciiz "\n"
			.align 2
	space:		.asciiz " "
			.align 2	
	arr_size: 	.space 400	
################# Code segment #####################
.text
.globl main

main:					# Main program entry

	li $v0, 4			# Service code for printing string
	la $a0, prompt			# Load address of prompt 1 into $a0
	syscall				# Print prompt 1 string
	
	li $v0, 5			# Service code to read integer
 	syscall				# Read integer input
 	
 	add  $a0, $v0, $zero		# Set $s0 = user input (arr length)
 	
 	add  $a1, $zero, $zero 		# set $s1 as i = 0
 	la   $s3, arr_size		# $s3 = arr size
		
reverse:  	
 	slt  $t0, $a1, $a0 		# $t0 = (i < array length) ? 1:0
 	beq  $t0, $zero, reverseEnd 	# if !(i < array length), branch to reverseEnd
 		
	li $v0, 5			# Service code to read integer
 	syscall				# Read integer
 		
 	add  $s2, $v0, $zero		# Set $s2 = user input (array int)
 		
 	sll  $t0, $a1, 2		# $t0 = i * 4
 	add  $t0, $s3, $t0		# $t0 = arr + (i * 4)
 	sw   $a2, 0($t0)		# $s2 = arr[i] 
 		
 	addi $s1, $s1, 1		# i = i + 1
 	j    reverse			# Repeat reverse
 		
reverseEnd:	
	li   $v0, 4			# Service code for printing string
	la   $a0, reverseMsg 		# Load address of reverseMsg into $a0
 	syscall				# Print reverseMsg string
 		
 	add  $a1, $a0, $zero 		# i = array length
 	addi $a1, $a1, -1		# i = i - 1
 
reverseLoop:		
	li   $v0, 4			# Service code for printing string
	la   $a0, space			# Load address of space into $a0
   	syscall				# Print space
   		
 	slt  $t0, $a1, $zero		# $t0 = (i < 0) ? 1:0
 	beq  $t0, $zero, ContinueLoop	# If !(i < 0), branch to reverseLoop
 	j    exit			# Else, proceed to exit
 
 		
ContinueLoop:	
	sll  $t0, $a1, 2		# $t0 = i * 4
 	add  $t0, $s3, $t0		# $t0 = arr + i * 4
 	lw   $t1, 0($t0)		# $t1 = arr[i]
 		
 	addi $v0, $zero, 1		# Prepare to print integer
 	add  $a0, $t1, $zero		# Set $a0 = arr[i] to print
 	syscall
 		
 	addi $a1, $a1, -1		# i = i - 1
 	j reverseLoop			# Repeat reverseLoop

exit:		
	li $v0, 10			# Exit program
	syscall
 		
