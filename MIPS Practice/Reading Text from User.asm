.data
     prompt:     .asciiz "Please input your name: "
     message:    .asciiz "Hello, "
     userInput:  .space  20		# Specify how many char the user can enter (array)
.text
     main:
     	  # Getting the user input as text
          li $v0, 8			# Read user-inputted string
          la $a0, userInput		# Pass the address of the variable to a0 as argumenr
          li $a1, 20
          syscall
          
          
          # Displays prompt message
          li $v0, 4			# Display string
          la $a0, prompt
          syscall
          
          # Displays Hello
          li $v0, 4			# Display string
          la $a0, message
          syscall
          
          # Display name
          li $v0, 4
          la $a0, userInput
          syscall
     
     
     
     # End of main
     li $v0, 10
     syscall
