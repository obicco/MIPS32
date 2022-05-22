.data
	promptMessage: 	.asciiz "Enter a number to find its factorial: "
	resultMessage:	.asciiz "\nThe factorial of the number is "
	number:			.word 0
	answer:			.word 0
.text
.globl main
.ent main

main:
	#Read the number from the user
	li		$v0, 4
	la		$a0, promptMessage
	syscall

	li		$v0, 5
	syscall

	sw		$v0, number

	#Call the factorial function
	lw		$a0, number
	jal		findFactorial
	sw		$v0, answer

	#Dispaly the result
	li		$v0, 4
	la		$a0, resultMessage
	syscall

	li		$v0, 1
	lw		$a0, answer
	syscall

	#End program
	li		$v0, 10
	syscall

.globl findFactorial
	findFactorial:
				subu	$sp, $sp, 8
				sw		$ra, ($sp)
				sw		$s0, 4($sp)

				#Base case (end recursion)
				li		$v0, 1
				beq		$a0, 0, factorialDone

				#Find factorial (number - 1)
				move	$s0, $a0
				sub 	$a0, $a0, 1
				jal		findFactorial

				mul		$v0, $s0, $v0

		factorialDone:
					lw		$ra, ($sp)
					lw		$s0, 4($sp)
					addu	$sp, $sp, 8

					jr		$ra