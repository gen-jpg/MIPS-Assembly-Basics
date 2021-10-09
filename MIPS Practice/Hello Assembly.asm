.data # contains all the data, those stored in RAM
	myMessage: .asciiz "Hello World \n"
	
.text # all the info your program needs, the instructions
	li $v0, 4 # print out a value to the screen
	la $a0, myMessage # loads the address of the message that is to be printed out, puts the message to a0 reg
	syscall # system execute