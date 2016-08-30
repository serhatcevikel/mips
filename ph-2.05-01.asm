# example in page 69 of patterson hennessy
# shift left and right operations
# reg $t2 = reg $s0 << 4 bits


.globl main
.text
main:
    li $s0 5 # load imm value 5 in s0
    sll $t2 $s0 4 # shift value in s0 4 bits left and put it in t2
    addi $a0 $t2 0 # add 0 to t2 to store in a0
    li $v0 1 # set v0 so that print integer at a0
    syscall # print integer at a0    
    srl $t3 $t2 2 # shift value in t2 2 bits right and put it in t3
    addi $a0 $t3 0 # mov value in t3 to a0
    syscall # print integer at a0    

	li $v0 10 # Sets $v0 to "10" to select exit syscall
    syscall # exit
