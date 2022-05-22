.data
.text
.globl main
.ent main

main:
	
	addi 	$t0, $zero, 30
	addi 	$t1, $zero, 5

	div		$t0, $t1		#Divides t0 by t1 and store in the $lo and $hi

	mflo	$s0				#Quotient
	mfhi	$s1				#Remainder

	li 		$v0, 1
	add 	$a0, $zero, $s0	#NOTE: s1 for reminder
	syscall

	.end main