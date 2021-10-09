.data
    PI: .float 3.14 # float with value 3.14
.text
    li $v0, 2 # 2 syscall for printing float
    lwc1 $f12, PI # load value from PI, put in f12 which is located in coprocessor 1 (call using lwc1) 
    syscall 
