.data
	message:	.asciiz "Hi, everybody! \nMy name is Oskar.\n"
.text
.globl main
.ent main

main:
	
	jal displayMessage	#jump at link (target)

	addi $s0, $zero, 5

	li $v0, 1			#Print number five
	add$a0, $zero, $s0
	syscall

	li	$v0, 10		#Tell the system that the program is done
	syscall		


	displayMessage:
		li	$v0, 4
		la	$a0, message
		syscall

		jr	$ra		#Go back to the function that called it

	.end main