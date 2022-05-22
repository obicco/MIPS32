.data
	message1: 	.asciiz "It was true\n"
	message2:	.asciiz "It was false\n"
	number1:	.float 10.4
	number2:	.float 4.6
.text
.globl main
.ent main

main:
	lwc1	$f0, number1
	lwc1	$f2, number2

	c.eq.s	$f0, $f2

	#bc1t/bc1f	#Branch if coprocessor 1 is true/false
	bc1t	exit

	li		$v0, 4
	la		$a0, message2
	syscall

	li 		$v0, 10
	syscall

	exit:
		li	$v0, 4
		la	$a0, message1
		syscall