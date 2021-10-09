# Title:  QUIZ2 CHP 3			Filename: MACRAYO - QUIZ2 CHP 3 
# Author: Genevive S. Macrayo		Date: October 29, 2020
# Description: Program to convert Celsius to Fahrenheit
# Input: Celsius value
# Output: Fahrenheit value

################# Data segment #####################
.data
	prompt:	    .asciiz     "Input Celsius value: "
	fahrenheit: .asciiz     "\nFahrenheit: "
	const1:	    .float 9
	const2:	    .float 5
	const3:	    .float 32
################### Code segment ###################
.text
.globl main				# C-F n x (9/5) + 32

main:				# Main program entry

	li $v0, 4		# Service code for printing string
	la $a0, prompt 		# Load address of prompt into $a0
	syscall			# Print prompt string
	
	li $v0, 6 		# Service code for reading float
	syscall
	
	l.s $f1, const1		# Load address of const1 into $f1
	mul.s $f0, $f0, $f1	# Divide the inputted Celsius value by 9 
	l.s $f1, const2		# Load address of const2 into $f2
	div.s $f0, $f0, $f1	# Divide (C * 9) by 5
	l.s $f1, const3		# Load address of const3 into $f1
	add.s $f0, $f0, $f1	# (C * 9/5) + 32
	
	li $v0, 4		# Service code for printing string
	la $a0, fahrenheit	# load address of fahrenheit to $a0
	syscall

	mov.s $f12, $f0		# Move value stored in $f0 into $f12
	li $v0, 2		# Print float value (fahrenheit)
	syscall
				
	li $v0, 10		# Service code to exit program
	syscall			# Exit program

	
	