# A FUNCTION is like a mini-program inside a program
# They are reusable, you can use them as many times as you like (make a function before calling it though)
# In MIPS they are called PROCEDURE

.data
     message: .asciiz "Hello, everyone!\n My name is Gen.\n"
.text # label is a name with a ":"
      # It is good practice to have the "main:" label in your function, main module/component
      
     main: 
          jal displayMessage # jumps to displayMessage function (calling the function)
          
          addi $s0, $zero, 5
          
          #Print the number 5 to the screen
          li $v0, 1
          add $a0, $zero, $s0
          syscall
     
     # Tell the system that the program is done, this is mandatory
     li  $v0, 10
     syscall  # Good practice so that the program doesn't end up in a loop, resulting in an error
     
     displayMessage:
         li $v0, 4 # display text
         la $a0, message
         syscall
         
         jr $ra # goes back to the procedure, returning to main
