.data

.text
     main: # Use $a registers to pass values as arguments, 0-3
     
     addi $a1, $zero, 50 # 50 is stored in a1, first argument
     addi $a2, $zero, 100 # 100 is stored in a2, second argument
     
     jal addNumbers # Procedure/Function call
     
     li $v0, 1
     addi $a0, $v1, 0
     syscall
         
         
     # Tell the program that the procedure is done
     li $v0, 10
     syscall
     
     #Procedure definition
     addNumbers:
        add $v1, $a1, $a2 # Sum is stored in v1, v1 is intended for return values
        
        jr $ra # Go back to the calling place
       
