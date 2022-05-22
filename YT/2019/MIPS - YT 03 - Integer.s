.data
	age: .word 22	#This is a word or integer	
.text
.globl main
.ent main

main:	#Prints an integer to the screen
	li $v0, 1
	lw $a0, age
	syscall

	.end main