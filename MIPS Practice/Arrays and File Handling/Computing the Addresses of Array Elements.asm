# address of array[i[, &array[i] = &array + i x element_size
# 2-d &matrix[i][j] = &matrix + (ixCols + j) x element_size

# for example
#	arr2: .word 1:10 ,,, 10 words = 1
# &matrix[i][j] = &matrix + (i x 20 + j) x 4

# Ex. Translate matrix[1][5] = 73 into assembly
# Compute first: &matrix[1][5] = &matrix + (1 x 20 + 5) x 4 = &matrix + 100

la $t0, matrix		# Load address: t0 = &matrix
li $t1, 73		# t1 = 73
sw $t1, 100($t0)	# matrix[1][5] = 73

## Take note that unlike high-programming languages, address calculation is 
## esstential when programming in assembly. One must calculate the
### addresses of array eleemnts precisely when processing arrays.