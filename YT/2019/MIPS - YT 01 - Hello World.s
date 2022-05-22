.data
	myMessage: .asciiz "Hello World \n"
.text
.globl main
.ent main

main:
	li $v0, 4
	la $a0, myMessage
	syscall

	.end main