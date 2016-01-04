# example in page 70 of patterson hennessy

.globl main
.text
main:
    li $s0 7 # load imm value 7 bin 00000111 in s0
    li $s1 14 # load imm value 14 bin 00001110 in s1
    and $t0 $s0 $s1 # bitwise and ($) on s0 and s1, result in t0
    or $t1 $s0 $s1 #bitwise or (|) on s0 and s1, result in t1
    nor $t2 $t1 $zero #bitwise nor on t1 and zero, in fact not of t1, in t2
    andi $t3 $t1 5 # and of t1 and imm 1
    ori $t4 $t1 5 # or of t1 and imm 5
    li $v0 1 # set v0 so that print integer at a0
    addi $a0 $t0 0 # add 0 to t0 to store in a0
    syscall # print integer at a0    
    addi $a0 $t1 0 # move t1 to a0 
    syscall # print integer at a0
    addi $a0 $t2 0 # move t2 to a0 
    syscall # print integer at a0
    addi $a0 $t3 0 # move t3 to a0 
    syscall # print integer at a0
    addi $a0 $t4 0 # move t4 to a0 
    syscall # print integer at a0
	
    li $v0 10 # Sets $v0 to "10" to select exit syscall
    syscall # exit
