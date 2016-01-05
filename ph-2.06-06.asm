# example in page 75 of patterson hennessy

.globl main
.text
main:
    li $t0 0 # put value 0 in t0, counter
    li $s1 2 # put value 2 in s1, comparison in slt
    li $t1 1
Loop: addi $t0 $t0 1 #increment counter
    slt $t2 $s1 $t0 # set t2 1 when s1 fixed on 2 is less than t0 counter
    beq $t2 $t1 Exit # when t2 is equal to t1 (1) go to exit
    j Loop # unconditional jump to Loop
Exit: li $v0 10 # Sets $v0 to "10" to select exit syscall
    syscall # exit
