.data
	myArray:	.space 12	#3 integers x 4 bytes
.text
.globl main
.ent main

main:
	addi	$s0, $zero, 4
	addi	$s1, $zero, 10
	addi	$s2, $zero, 12

	addi	$t0, $zero, 0		#Clear t0

	sw		$s0, myArray($t0)
		addi	$t0, $t0, 4
	sw		$s1, myArray($t0)
		addi	$t0, $t0, 4
	sw		$s2, myArray($t0)
		addi	$t0, $t0, 4

	lw		$t6, myArray($zero)	#Storing the value in t6

	li		$v0, 1
	addi	$a0, $t6, 0
	syscall