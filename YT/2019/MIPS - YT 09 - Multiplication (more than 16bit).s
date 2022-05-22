.data
	
.text
.globl main
.ent main

main:
	
	addi 	$t0, $zero, 2000
	addi 	$t1, $zero, 10

	mult	 $t0, $t1 			#stores the result in $lo and $hi

	mflo $s0					#Moves from $lo to s0 (the product of mult)

	li $v0, 1
	add $a0, $zero, $s0
	syscall

	.end main