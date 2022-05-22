.data
	number1: 	.word 20
	number2:	.word 8
.text
.globl main
.ent main

main:
	
	lw $s0, number1	# s0 = 20
	lw $s1, number2	# s1 = 8

	sub $t0, $s0, $s1	# t0 = 20 - 8

	li $v0, 1
	move $a0, $t0
	syscall

	.end main