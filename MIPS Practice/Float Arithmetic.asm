.data
     num1: .double 3.14
     num2: .double 2.71
.text
	# When using float you have to use lwc1
	# When using double you have to use ldc1
     main:
          ldc1 $f2, num1			# The value of num1 is placed in f2
          ldc1 $f4, num2			# The value of num2 is placed in f4
          
          add.d $f12, $f2, $f4			# Sum is placed in f12
          
          li $v0, 3				# Display value
          syscall
          
          li $v0, 10				# Exit program
          syscall