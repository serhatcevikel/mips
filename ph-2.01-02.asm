# example in page 52 of patterson hennessy

.globl main
.text
main:
    li $s1 6 # load immediate value 6 into saved register s1
    li $s2 5 # load immediate value 5 into saved register s2
    li $s3 7 # load immediate value 7 into saved register s3
    li $s4 2 # load immediate value 2 into saved register s4
    add $t0 $s1 $s2 # add s1 and s2 values and put into t0 temp register
    add $t1 $s3 $s4 # add s3 and s4 values and put into t0 temp register
    sub $s0 $t0 $t1 # subtract t1 from t0 values and put into s0 register
	li $v0 1 # Sets $v0 to "1" to select print integer syscall
    add $a0 $s0 $zero # load value in s0 to register a0 so that syscall prints
    #li $a0, 4 # load value in s0 to register a0 so that syscall prints
    syscall 
	li $v0 10 # Sets $v0 to "1" to select print integer syscall
    syscall 
