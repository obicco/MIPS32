.data
	myCharacter:	.byte 'm'
.text
.globl main
.ent main

main:
	li $v0, 4
	la $a0, myCharacter
	syscall

	.end main