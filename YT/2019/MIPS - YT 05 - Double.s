.data
	myDouble:		.double 7.202
	zeroDouble: 	.double 0.0
.text
.globl main
.ent main

main:
	ldc1 	$f2, myDouble
	ldc1 	$f0, zeroDouble

	li 		$v0, 3
	add.d 	$f12, $f2, $f0
	syscall

	.end main