.data
	message:	.asciiz "The number is less than other."
.text
.globl main
.ent main

main:
	addi 	$t0, $zero, 1
	addi	$t1, $zero, 200

	slt 	$s0, $t0, $t1		#First is destination register (yes 1, no zero)
	bne		$s0, $zero, printMessage

	li 		$v0, 10
	syscall

	printMessage:
		li 	$v0, 4
		la 	$a0, message
		syscall

