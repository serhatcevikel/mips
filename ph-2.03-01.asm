# example in page 55 of patterson hennessy
# load and save arrays of data
# C code:
# f = (g + h) – (i + j);

.globl main
.text
main:
    li $s3 0x10000000 # load address 100000000 - start of array - in s3. that is the base address
    li $t0 5 # load value 5 into t0
    sw $t0 0($s3) # save value in t0 to memory address in s3 + 0 offset
    li $t0 10 # load value 10 into t0
    sw $t0 4($s3) # save value in t0 to memory address in s3 + 4 offset
    li $t0 25 # load value 25 into t0
    sw $t0 8($s3) # save value in t0 to memory address in s3 + 8 offset
    lw $t1 8($s3) # load value in memory addrees at s3 + 8 offset to t1
    li $s2 15 # load value 15 in s2
    add $s1 $s2 $t1 # add value in s2 and value in t1 to s1
    sw $s1 12($s3) # save value in s1 to address in s3 + 12 offset 
    lw $a0 12($s3) # load value at address in s3 + 12 offsett to a0
    li $v0 1 # set v0 so that print integer at a0
    syscall # print integer at a0    

	li $v0 10 # Sets $v0 to "10" to select exit syscall
    syscall # exit
