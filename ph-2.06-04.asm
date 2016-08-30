# example in page 72-73 of patterson hennessy
# conditional using bew (branch if equal)
# C code:
# if (i == j) f = g + h; else f = g – h;

.globl main
.text
main:
    li $s1 10 # load imm value 10 in s1
    li $s2 8
    li $s3 9
    li $s4 10
    beq $s3 $s4 Then # if value in s3 is equal to value in s4, go to line labeled Then
    sub $s0 $s1 $s2 # if s3<>s4, then subtract values in s1 and s2 to s0
    j Exit # unconditionally jump to line labeled Exit

Then: add $s0 $s1 $s2 # if s3=s4 then add s2 and s1 to s0

Exit: li $v0 10 # Sets $v0 to "10" to select exit syscall
    syscall # exit
