.data
	myArray: 	.word 10:6 	#6 eleements initialized as 10
	newLine:	.asciiz "\n"
.text
.globl main
.ent main

main:
	addi	$t0, $zero, 0 		#clear t0 to 0

	while:
		beq 	$t0, 24, exit	#Remember to change the number of bytes for the array dimension

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