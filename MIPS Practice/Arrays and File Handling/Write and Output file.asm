# Program that writes a string to an output file

.data
     outfile: .asciiz "out.txt"		# output file name
     msg:     .asciiz "This text should be written in file out.txt"
     
.text
     li    $v0, 13		# Service call to OPEN FILE
     la    $a0, outfile		# Output file name
     li    $a1, 1		# Write-only with create
     syscall			# Open file
     
     move $s0, $v0		# $s0 = file descriptor
     li   $v0, 15		# Service call to WRITE TO FILE
     move $a0, $s0		# $a0 = file descriptor
     la   $a1, msg		# $a1 = address of buffer
     li   $a2, 43		# $a2 = number of characters to write
     syscall
     
     li   $v0, 16		# Service call to CLOSE FILE
     move $a0, $s0		# $a0 = file descriptor
     syscall			# CLOSE FILE