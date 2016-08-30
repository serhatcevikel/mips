# example in page 92 of patterson hennessy
# copying strings
# C code:
#void strcpy (char x[], char y[])
#{
#   int i;
#   i = 0;
#   while ((x[i] = y[i]) != ‘\0’) /* copy & test byte */
#   i += 1;
#}


.globl main
.text
main:
    li $a0 0x10000000 # load address of the start of first string at a0
    addi $a1 $a0 4 # load address of the start of second string (1 word offset) at a1
    li $t0 83 # load "S" at t0
    li $t1 101 # load "e" at t1
    li $t2 114 # load "r" at t2
    li $t3 0 # load 0 at t3
    sb $t0 0($a1) #save "S" at first address of second string
    sb $t1 1($a1) # save "e" at the next byte
    sb $t2 2($a1) # save "r" at the next byte
    sb $t3 3($a1) # save 0 at the next byte
    li $s0 0 # save 0 at s0
    jal strcopy # jump to strcopy and save next address at ra
    j Exit # jump to Exit

strcopy:
    addi $sp $sp -4 # adjust stack for 1 more item
    sw $s0 0($sp) # save s0 at stack
    add $s0 $zero $zero # i = 0+0

    L1: # copy characters until 0 
        add $t1 $s0 $a1 # increment the address of second string into t1
        lb $t2 0($t1) # loads the character byte from sceond string into t2
        add $t3 $s0 $a0 # increment the address of first string into t3
        sb $t2 0($t3) # saves the character byte at t2 into the address at t3
        beq $t2 $zero L2 # if the character byte is 0 jump to L2
        addi $s0 $s0 1 # increment s0
        j L1 # unconditional jump to L1

    L2: # prepare for printing the copied string
        addi $sp $sp -4 # increments stack pointer 
        sw $a0 0($sp) # put base address of first string at stack      
        li $v0 11 # set v0 to 11 so that prints character  
        li $t0 0 # set t0 at 0
        lw $t1 0($sp) # puts the base address to t1

    Print: # print the copied string
        lb $a0 0($t1) # loads the value at the address at t1 to a0
        syscall # print character
        beq $t0 $s0 Return # if at the end of string go to Return
        addi $t0 $t0 1 # increment t0, counter of characters
        addi $t1 $t1 1 # increment t1, address of character
        j Print # jump to Print again 

    Return: # Returns back values and readjusts the stack pointer
        lw $a0 0($sp)
        addi $sp $sp 4 # readjusts stack by popping off 2 words
        lw $s0 0($sp) # loads previous value of s0 back from stack
        addi $sp $sp 4 # readjusts stack by popping off 2 words
        jr $ra # jump to ra

Exit:
    li $v0 10 # Sets $v0 to "10" to select exit syscall
    syscall # exit 
