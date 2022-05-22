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

	li 		$v0, 1				#Prints 10
	move	$a0, $s0
	syscall
		

	li 	$v0, 10
	syscall

	#If you are using a "s" register you are not allowed to modify the value 
	#like in the "t" register, so you have to use the stack
	increaseMyRegister:
		addi	$sp, $sp, -4	#Allocate space in only one element
		sw		$s0, 0($sp)		#This is the first position of the stack

		addi 	$s0, $s0, 30

		li 		$v0, 1
		move	$a0, $s0
		syscall

		lw		$s0, 0($sp)
		addi	$sp, $sp, 4

		jr		$ra