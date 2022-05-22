.data
	message: 		.asciiz "ENter the value of PI: "
	zeroAsFloat: 	.float 0.0
.text
.globl main
.ent main

main:
	lwc1	$f4, zeroAsFloat

	li		$v0, 4			#Display message
	la		$a0, message
	syscall

	li		$v0, 6			#Read user's input
	syscall

	li		$v0, 2			#Display value
	add.s	$f12, $f0, $f4
	syscall

	.end main