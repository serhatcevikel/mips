# example in page 96 of patterson hennessy
# loading a 32-bit constant
# What is the MIPS assembly code to load this 32-bit constant into register $s0?
# 0000 0000 0011 1101 0000 1001 0000 0000


.globl main
.text
main:
    lui $s0 61 # load upper immediate decimal of upper 16 bits into s0
    ori $s0 $s0 2304 # bitwise or immediate means adding the lower bits (all 0 in the s0 before "or"

    ori $a0 $s0 0 # set a0 to value of s0
    li $v0 1 # set v0 to print int at a0
    syscall # print int at a0 
    li $v0 10 # Sets $v0 to "10" to select exit syscall
    syscall # exit
