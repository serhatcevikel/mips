# example in page 81 of patterson hennessy
# procedure call

# C code:
# int leaf_example (int g, int h, int i, int j)
# {
#   int f;
#   f = (g + h) – (i + j);
# return f;
# }

# $a0-$a3 argument registers
# $v0-$v1 return value registers
# ra: return address register
# jal: jump and link: jumps to the address and saves the address of the following instruction in register ra
# jr: jump register: jump to the address specified in the register
# sp: stack pointer register
# stack pointer always points to the top of the stack or the last word in the stack

.globl main
.text
main:
    li $t1 5 # load value 5 in t1
    li $t0 8 # load value 8 in t0
    li $s0 6 # load value 6 in s0
    li $a0 1 # load value 1 in a0, 1st argument
    li $a1 2 # load value 2 in a1, 2nd argument
    li $a2 3 # load value 3 in a2, 3rd argument
    li $a3 4 # load value 4 in a3, 4th argument
jal leaf_example # jump to leaf_example procedure and save the address of the next instruction to "ra" (return address) register
    j Exit # unconditional jump to exit
leaf_example: # name of the procedure/function
    addi $sp $sp -12 # make room of 3 words in stack by decreasing stack pointer register
    sw $t1 8($sp) # save register t1 in lower empty word of stack
    sw $t0 4($sp) # save register t0 in middle empty word of stack
    sw $s0 0($sp) # save register s0 in upper empty word of stack
    add $t0 $a0 $a1 # add 1st and 2nd arguments into t0
    add $t1 $a1 $a2 # add 3rd and 4th argument into t1
    sub $s0 $t0 $t1 # subtract t1 from t0 into s0
    add $v0 $s0 $zero # put s0 into v0, for return value
    lw $s0 0($sp) # restore register s0
    lw $t0 4($sp) # restore t0
    lw $t1 8($sp) # restore t1
    addi $sp $sp 12 # stack pointer is readjusted
    jr $ra # jump back to address at ra

Exit:
    add $a0 $v0 $zero # load value in v0 to register a0 so that syscall prints
	li $v0 1 # Sets $v0 to "1" to select print integer syscall
    syscall # print value at a0 
    li $v0 10 # Sets $v0 to "10" to select exit syscall
    syscall # exit 
