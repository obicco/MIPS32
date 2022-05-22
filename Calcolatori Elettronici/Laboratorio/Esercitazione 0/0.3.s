.data
    wOpd1:   .word 10
    wOpd2:   .word 24
    wResult: .space 4   #numero byte riservati per var risultato
.text
.globl main
.ent main
main:
    lw      $t0, wOpd1
    lw      $t1, wOpd2

    add		$t2, $t1, $t0		# $t2 = $t1 + 0t2
    sw		$t2, wResult		

    li      $v0, 10
    syscall
.end main