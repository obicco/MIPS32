.data
	prompt:	.asciiz "Enter the value of e: "
.text
.globl main
.ent main

main:
	li 		$v0, 4
	la		$a0, prompt
	syscall

	li		$v0, 7
	syscall

	li		$v0, 3
	add.d	$f12, $f0, $f10		#Need to check on coprocessor 1 registers wich one have 0.0 double values (ex. f10)
	syscall

	.end main