.data
	message: 	.asciiz "Hello, "
	userInput:	.space	20			#It's like an array & number of characters
.text
.globl main
.ent main

main:
	li 		$v0, 8			#Getting user's input as text
	la		$a0, userInput
	li 		$a1, 20
	syscall

	li 		$v0, 4			#Display hello
	la		$a0, message
	syscall

	li 		$v0, 4			#Display name
	la		$a0, userInput
	syscall

	li		$v0, 10			#Tell the system this is the end of main
	syscall