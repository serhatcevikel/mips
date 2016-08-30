# example in page 75 of patterson hennessy
# set on less than immediate

.globl main
.text
main:
    li $t0 0 # put value 0 in t0, counter
Loop: addi $t0 $t0 1 #increment counter
    slti $t2 $t0 2 # set t2 1 when t0 counter is less fixed 2
    beq $t2 $zero Exit # when t2 is equal to zero go to exit
    j Loop # unconditional jump to Loop
Exit: li $v0 10 # Sets $v0 to "10" to select exit syscall
    syscall # exit
