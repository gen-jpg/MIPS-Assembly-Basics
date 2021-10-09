## Converting a 2-d array 
## int M[10][5];
## for (i = 0; i < 10; i++) 
##     { M[i][3] = i;
## }

.data
     M: .word 0:50 			# array of 50 words
  #  &M[i][3] = &M + (i x 5 + 3) x 4 = &M + i x 20 + 12
  
.text
     la    $t0, M			# t0 = &M[0][0]
     li    $t1, 0			# t1 = i = 0
     li    $t2, 10			# t2 = 10
     
for:
     sll   $t3, $t1, 4			# t3 = i x 16
     sll   $t4, $t1, 2			# t4 = i x 4
     add   $t5, $t3, $t4		# t5 = i x 20
     add   $t5, $t0, $t5		# t5 = &M + i x 20
     sw    $t1, 12($t5)			# store: M[i][3] = i
     addi  $t1, $t1, 1			# i++
     bne   $t1, $t2, for		# branch if (i != 10)
     
     
# The for loop sets the elements of colum 4 to their row numbers
# The first four instructions used in the for loop are used for address computation
# Because each row has 5 int elements, the distance bet two consecutive 
# eleemnts in the same column is 20 bytes.

# The code from above is rewritten to use $t0 as a pointer. 
# This will reduce the no. of instructions in the loop from 7 to 4

.data
     M: .word 0:50 			# array of 50 words
  #  &M[i][3] = &M + (i x 5 + 3) x 4 = &M + i x 20 + 12
  # &M[i +1][3] = &M[i][3] + 20
.text
     la    $t0, M			# t0 = &M[0][0]
     li    $t1, 0			# t1 = i = 0
     li    $t2, 10			# t2 = 10
     
for:
     sw    $t1, 12($t0)			# store: M[i][3] = i
     addi  $t1, $t1, 1			# i++
     addi  $t0, $t0, 20			# t0 = &M[i][3]
     bne   $t1, $t2, for		# branch if (i != 10)

