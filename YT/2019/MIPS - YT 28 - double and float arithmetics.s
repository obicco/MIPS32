.data
	number1:	.float 3.14
	number2:	.float 2.71
	double1:	.double 3.14
	double2:	.double 2.71
.text
.globl main
.ent main

main:
	lwc1		$f2, number1
	lwc1		$f4, number2

	add.s		$f12, $f2, $f4

	ldc1		$f6, double1
	ldc1		$f8, double2

	add.d		$f14, $f6, $f8
	#mul.d & mult.s, div.d & div.s is used for multiplication and division

	li 			$v0, 3
	syscall