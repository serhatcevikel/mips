# example in page 72-73 of patterson hennessy

.globl main
.text
main:
li $s0 0x10000000 # put address 10000000 into s0, base address
li $t0 0 # put value 1 in t0, counter
li $s1 100 # put value 100 in s1, length of array
Loop1: addi $t0 1 # increment t0 by 1
    sll $t1 $t0 2 # shift t0 value by 2 digits > multiply by 4
    add $t2 $s0 $t1 # put the offsetted address into t2    
# sw $t0 $t1($s0)
    sw $t0 0($t2) # save t0 value to t2 address
    bne $t0 $s1 Loop1 # until t0 reaches s1 continue the loop

# now that we have an array of 100, we code the while loop in C:
# while (save[i] != ik)
# i +=1;

li $s0 0x10000000 # base address
li $t0 0 # start the counter at 0 again
li $s1 80 # where the condition ends
Loop2: sll $t1 $t0 2 # put the 2 digit left shifted value of t0 in t1
    add $t2 $t1 $s0 # offset the adress into t2
    lw $t3 0($t2) # load the value in array
    beq $t3 $s1 Exit # if they are equal go to Exit
    addi $t0 $t0 1
    j Loop2 # unconditional jump to Loop2
 
Exit: ori $a0 $t0 0 # set a0 to t0
    li $v0 1 # set v0 to print int at a0
    syscall # print int at a0 
    li $v0 10 # Sets $v0 to "10" to select exit syscall
    syscall # exit
