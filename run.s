#EXERCISE 3
.data
MSG1: .asciiz "Enter in a number greater than zero: "
HELLO: .asciiz "Hello World!\n"
ERROR: .asciiz "Number less than 1, re-enter: "
.text
.globl main
main: 
    li $v0, 4
    la $a0, MSG1
    syscall

test:
    li $v0, 5
    syscall
    move $s1, $v0
    blez $s1, BADN

TOPL:
    li $v0, 4
    la $a0, HELLO
    syscall
    addiu $s1, $s1, -1
    bgtz $s1, TOPL

    jr $ra

BADN:
    li $v0, 4
    la $a0, ERROR
    syscall
    j test