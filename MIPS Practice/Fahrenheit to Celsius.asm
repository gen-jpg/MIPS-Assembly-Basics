# Title:  QUIZ2 CHP 3			Filename: MACRAYO - QUIZ2 CHP 3 
# Author: Genevive S. Macrayo		Date: October 29, 2020
# Description: Program to convert Fahrenheit to Celsius
# Input: Fahrenheit value
# Output: Celsius value

################# Data segment #####################
.data
	prompt:	 .asciiz     "Input Fahrenheit value: "
	celsius: .asciiz     "\nCelsius: "
	const1:	 .float 32
	const2:	 .float 5
	const3:	 .float 9
################### Code segment ###################
.text
.globl main

main:				# Main program entry

	li $v0, 4		# Service code for printing string
	la $a0, prompt		# Load address of prompt into $a0
	syscall			# Print prompt string

	li $v0, 6		# Read float
	syscall

	l.s $f1, const1		# Load float address of const3 to $f1
	sub.s $f0, $f0, $f1	# Subtract the inputted Fahrenheit value stored in $f0 by 32 (F - 32)
	l.s $f1, const2		# Load float address of const2 to $f1
	mul.s $f0, $f0, $f1	# Multiply(F-32) by 5
	l.s $f1, const3		# Load  float adddress of $const1 to $f1 
	div.s $f0, $f0, $f1	# Divide (F-32)(5) by 9	

	li $v0, 4		# Service code for printing string
	la $a0, celsius		# load address of celsius to $a0
	syscall

	mov.s $f12, $f0		# Move value stored in $f0 into $f12
	li $v0, 2		# Print float value (Celsius)
	syscall
				
	li $v0, 10		# Service code to exit program
	syscall			# Exit program
