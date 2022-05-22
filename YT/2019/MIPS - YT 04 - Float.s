.data
	PI:	.float 3.14
.text
.globl main
.ent main

main:	
	li		$v0, 2
	lwcl	$f12, PI
	syscall

	.end main