.globl main
.text
main:
    li $t0 5 # load immediate value 5 into temporary register t0
    li $t1 8 # load immediate value 8 into temporary register t1
    add $s0 $t0 $t1 # add t0 and t1 values and put into s0 saved register
	li $v0 1 # Sets $v0 to "1" to select print integer syscall
    add $a0 $s0 $zero # load value in s0 to register a0 so that syscall prints
    #li $a0, 4 # load value in s0 to register a0 so that syscall prints
    syscall 
	li $v0 10 # Sets $v0 to "1" to select print integer syscall
    syscall 
