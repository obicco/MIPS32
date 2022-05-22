.data
.text
.globl main
.ent main

main:
	
	addi	$t0, $zero, 30
	addi	$t1, $zero, 5

	div		$s0, $t0, $t1		#Value t0 divided by t1 and stored in s0 (version 3 arguments)
								#Note: I can even put as third argument a number "ex. 10"

	li 		$v0, 1
	add 	$a0, $zero, $s0
	syscall

	.end main