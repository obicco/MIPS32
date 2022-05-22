.data
	mdArray:	.word 2, 5
				.word 3, 7
	size: 		.word 2
.text
.globl main
.ent main

main:
	la		$a0, mdArray
	lw		$a1, size
	jal 	sumDiagonal
	move	$a0, $v0
	li		$v0, 1
	syscall

	li 		$v0, 10
	syscall

	sumDiagonal:
			li		$v0, 0		#sum = 0
			li		$t0, 0		# t0 = index


			sumLoop:
				mul 	$t1, $t0, $a1			# t1 = rowIndex * numColumns
				add		$t1, $t1, $t0			# + colIndex
				mul 	$t1, $t1, 4				#multiply by the data size (4 bytes for integers)
				add		$t1, $t1, $a0			#adding base address

				lw		$t2, ($t1)
				add 	$v0, $v0, $t2			#sum = sum + mdArray [i][i]

				addi 	$t0, $t0, 1				#i++
				blt		$t0, $a1, sumLoop		#if i < size then loop again

			jr		$ra