#EXERCISE 1
.data
MSG1:   .asciiz "Please enter a number between 0 and 100: "
MSG2:   .asciiz "Invalid number. Please re-enter: "
MSG3:   .asciiz "\nGood number, it is: "
        .align 2    #Forces the program to be on full word boundary
.text
.globl main

main:
    li $v0, 4 #Tell syscall to print ou a string
    la $a0, MSG1 #Tell syscall which string to print
    syscall #Print the string

test:
    li $v0, 5 #Tell syscall to read an integer
    syscall #Read the integer
    move $s1, $v0 #Save the integer read in $s0
    bltz $s1, BADN #if less than 0 go to BADN
    li $t1, 100
    bgt $s1, $t1, BADN # If greater than 100 got BADN

    li $v0, 4 #Tell syscall to print ou a string
    la $a0, MSG3 #Tell syscall which string to print
    syscall #Print the string

    li $v0, 1 #Tell syscall to print an integer
    move $a0, $s1 #move integer to a0
    syscall

    jr $ra #Stop the program

BADN:
    li $v0, 4 #Tell syscall to print ou a string
    la $a0, MSG2 #Tell syscall which string to print
    syscall #Print the string
    j   test

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