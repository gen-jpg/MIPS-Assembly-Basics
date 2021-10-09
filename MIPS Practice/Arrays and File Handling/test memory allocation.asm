#### label: .type calue [, value]...
#### 2-d array matrix[Rows][Cols] -- matrix: .word 0:200 # 10 by 20 word elements initialized to 0

.data
     arr1: .half 5, -1		# array of 2 half words, initialized to 5, -1
     arr2: .word 1:10		# array of 10 words, all initialized to 1
     arr3: .space 20		# array of 20 bytes, unitianalized
     str1: .ascii	"This is a string"
     str2: .asciiz	"Null-terminated string"


.text
main:				# main program entry
     li $a0, 100 		# $a0 = 100, number of bytes to allocate
     li $v0, 9			# System call 
     syscall			# Allocate 100 bytes on the heap
     move $t0, $v0		# $t0 = address of first block of memory
     li $a0, 200		# $a0 = 200, number of bytes to allocate
     li $v0, 9			# System call 
     syscall 			# Allocate 200 bytes on the heap
     move $t1, $v0		# t1 = address of second block		
	