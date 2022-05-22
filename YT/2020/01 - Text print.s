    .data
one:    .asciiz "This is string one!\n"
two:    .asciiz "This is string two!\n"
    .text

main:   li $v0, 4
        la $a0, one
        syscall

        la $a0, two
        syscall

        .data
hello:  .asciiz "Hello World!\n"
        .text

        la $a0, hello
        syscall

        li $v0, 10
        syscall