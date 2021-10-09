 .data
    age: .word 23 $ # this is a word or int; note: an integer has 4 bytes
 .text
    #Print an int to the screen
    li $v0, 1 # print out an integer
    lw $a0, age # move the value of age to $a0 register
    syscall