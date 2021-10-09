.data
    myCharacter: .byte 'm' # declare variable, 1 char = 1 byte, 8 bits
.text
    li $v0, 4 # tells the system to print out the text
    la $a0, myCharacter # proceed to address of the value to be printed out
    syscall