# example in page 83-85 of patterson hennessy
# rescursive algorithm for factorial procedure

# C cod:
# int fact (int n)
# {
#   if (n < 1) return (1);
#       else return (n * fact(n-1));
# }

.globl main
.text
main:
    li $a0 3 # load value 3 into argument register - n in factorial(n)

    jal fact # jump to factorial procedure and save the address of next instruction to ra
    j Exit # unconditional jump to exit
fact:
    addi $sp $sp -8 #adjust stack for 2 items
    sw $ra 4($sp) # save return address at lower stack
    sw $a0 0($sp) # save argument n at higher stack
    slti $t0 $a0 1 # if a0 smaller than 1 then set t0 to 1
    beq $t0 $zero L1 # if t0 is 0 - n>=1, then go to L1
    addi $v0 $zero 1 # if n smaller than 1 then return value of 1
    addi $sp $sp 8 # readjust stack (pop 2 items off)
    jr $ra # return to the address of the instruction after jal
    L1: addi $a0 $a0 -1 # when n>=1, n is decremented by 1
        jal fact # call fact again

    lw $a0 0($sp) # return from jal, restore n
    lw $ra 4($sp) # restore ra
    addi $sp $sp 8 # readjust stack pointer to pop off 2 items
    mul $v0 $a0 $v0 # multiply current return value with n and adjust return value
    jr $ra # return to the jal address

Exit:
    add $a0 $v0 $zero # load value in v0 to register a0 so that syscall prints
	li $v0 1 # Sets $v0 to "1" to select print integer syscall
    syscall # print value at a0 
    li $v0 10 # Sets $v0 to "10" to select exit syscall
    syscall # exit 
