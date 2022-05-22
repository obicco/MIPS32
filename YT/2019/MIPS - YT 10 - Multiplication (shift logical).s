.data
.text
.globl main
.ent main

main:
	
	addi	$s0, $zero, 4

	sll		$t0, $s0, 2 	#Multiply 2 to the eye (2^2) from s0 to t0
							#Note: 3 is 2^3 etc..

	li $v0, 1
	add $a0, $zero, $t0
	syscall
	
	.end main