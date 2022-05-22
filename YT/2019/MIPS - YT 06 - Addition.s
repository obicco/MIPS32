.data
	number1:	.word 5
	number2:	.word 10

.text
.globl main
.ent main

main:
	
	lw	$t0, number1($zero)
	lw	$t1, number2($zero)

	add $t2, $t0, $t1	# t2 = t0 + t1

	li 	$v0, 1
	add	$a0, $zero, $t2		#a0 is the argument, it's just to move the value
	syscall

	.end main