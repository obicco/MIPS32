.data
	myArray: 	.space 12
	newLine:	.asciiz "\n"
.text
.globl main
.ent main

main:
	addi	$s0, $zero, 4
	addi	$s1, $zero, 10
	addi	$s2, $zero, 12

	addi	$t0, $zero, 0

	sw		$s0, myArray($t0)
		addi	$t0, $t0, 4
	sw		$s1, myArray($t0)
		addi	$t0, $t0, 4
	sw		$s2, myArray($t0)
		addi	$t0, $t0, 4
	
	addi	$t0, $zero, 0 		#clear t0 to 0

	while:
		beq 	$t0, 12, exit

		lw		$t6, myArray($t0)

		addi	$t0, $t0, 4		#Shifting

		li 		$v0, 1			#Print current number
		move	$a0, $t6
		syscall

		li 		$v0, 4			#Print new line
		la		$a0, newLine
		syscall

		j while

	exit:
		li 		$v0, 10
		syscall