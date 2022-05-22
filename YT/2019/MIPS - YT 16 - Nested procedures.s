.data
	newLine:	.asciiz "\n"
.text
.globl main
.ent main

main:
	
	addi 	$s0, $zero, 10

	jal increaseMyRegister

	li 		$v0, 4
	la		$a0, newLine
	syscall

	jal		printValue

	li 	$v0, 10
	syscall

	#If you are using a "s" register you are not allowed to modify the value 
	#like in the "t" register, so you have to use the stack
	increaseMyRegister:
		addi	$sp, $sp, -8	#Allocate space in only two element (2 x 4bytes)
		sw		$s0, 0($sp)		#This is the first position of the stack
		sw		$ra, 4($sp)

		addi 	$s0, $s0, 30

		jal		printValue

		lw		$s0, 0($sp)
		lw		$ra, 4($sp)
		addi	$sp, $sp, 8

		jr		$ra

	printValue:
		li 		$v0, 1
		move	$a0, $s0
		syscall

		jr 		$ra