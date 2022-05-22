.data
	prompt:		.asciiz "Enter your age: "
	message: 	.asciiz "\nYour age is "
.text
.globl main
.ent main

main:
	li 		$v0, 4		#Prompt the user to enter the age
	la		$a0, prompt
	syscall

	li		$v0, 5		#Get the user's age
	syscall

	move	$t0, $v0	#Store the result in t0

	li 		$v0, 4		#Display message
	la		$a0, message
	syscall

	li 		$v0, 1		#Print the age
	move 	$a0, $t0
	syscall

	.end main