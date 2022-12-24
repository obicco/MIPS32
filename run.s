#EXERCISE 2
.data
MSG1:   .asciiz "Enter the first number: "
MSG2:   .asciiz "Enter the second number: "
MSG3:   .asciiz "\nThe quotient is: "
MSG4:   .asciiz "\nThe reminder is: "
.text
.globl main

main: 
    li $v0, 4 
    la $a0, MSG1 
    syscall

    li $v0, 5
    syscall
    move $s1, $v0

    li $v0, 4 
    la $a0, MSG2 
    syscall

    li $v0, 5
    syscall
    move $s2, $v0

    div $s1, $s2
    li $v0, 4
    la $a0, MSG3
    syscall
    li $v0, 1
    mflo $a0
    syscall

    li $v0, 4
    la $a0, MSG4
    syscall
    li $v0, 1
    mfhi $a0
    syscall
    
    jr $ra