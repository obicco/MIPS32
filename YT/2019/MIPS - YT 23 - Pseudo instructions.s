.data
	message:	.asciiz "Hi, how are you?"
.text
.globl main
.ent main

main:
	addi	$s0, $zero, 14
	addi	$s1, $zero, 10

	bgt		$s0, $s1, displayHi		#Branch if greater than
		#Is a pseudo instruction, we can also use "bls" branch less than etc..

	li 		$v0, 10
	syscall

	displayHi:
		li	$v0, 4
		la	$a0, message
		syscall