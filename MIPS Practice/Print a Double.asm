.data
     myDouble: .double 7.202 # doubles take 2 registers, always use EVEN registers
     zeroDouble: .double 0.0 # note that unlike int, doubles do not have a $ for them 
.text
     ldc1 $f2, myDouble # will be stored in f2 and f3, each corresponding to 32 bits = 64 bits for double
     ldc1 $f0, zeroDouble # will be stored in f0 and f1
     
     li $v0, 3 # print double
     add.d $f12, $f2, $f0 # pass value as arg, addition of values in f2 and f0 and store sum in f12
     syscall