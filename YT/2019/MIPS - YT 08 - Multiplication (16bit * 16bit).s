.data

.text
.globl main
.ent main

main:
	addi $s0, $zero, 10	# Add imm. number 10 with zero and put it into s0
	addi $s1, $zero, 4

	mul $t0, $s0, $s1 #multiply s0 and s1 and put into t0

	li $v0, 1
	add $a0, $zero, $t0
	syscall

	.end main