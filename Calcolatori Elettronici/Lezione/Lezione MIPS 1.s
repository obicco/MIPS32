# 1.write 0 in $t0

.text                       #pseudoistruzioni
.globl main
.ent main
main:
    and     $t0, $0, $0         #istruzioni
    li      $v0, 10
    syscall
.end main


# 2.reading 2 values from memory, adding and writing them back

.data
opd1:   .word 0x00005678    #tutti e tre indicano un 4 byte
opd2:   .word 0x12340000
result: .space 4
.text
.globl main
.ent main
main:
    la		$t0, opd1
    lw		$t1, ($t0)
    la      $t0, opd2
    lw		$t2, ($t0)
    add     $t3, $t1, $t2
    sw		$t3, result
    li      $v0, 10
    syscall
.end main


# 3.adds all the elements of a vector (I)
.data
vett:   .word 5, 7, 3, 4, 3
result: .word 0

.text
.globl main
.ent main
main:
    la      $t3, vett           #load address of vett
    and     $t4, $0, $0         # temporary register = 0
    lw      $t0, ($t3)          # load first element from vett
    add     $t4, $t4, $t0       # add to the temp register
    addi    $t3, $t3, 4         # update index
    lw      $t0, ($t3)          # load first element from vett
    add     $t4, $t4, $t0       # add to the temp register
    addi    $t3, $t3, 4         # update index
    lw      $t0, ($t3)          # load first element from vett
    add     $t4, $t4, $t0       # add to the temp register
    addi    $t3, $t3, 4         # update index
    lw      $t0, ($t3)          # load first element from vett
    add     $t4, $t4, $t0       # add to the temp register
    addi    $t3, $t3, 4         # update index
    lw      $t0, ($t3)          # load first element from vett
    add     $t4, $t4, $t0       # add to the temp register
    la      $t3, result 
    sw      $t4, ($t3)          # write result to memory
    li      $v0, 10
    syscall 
.end main


# 4.adds all the elements of a vector (II)
.data
vett:   .word 5, 7, 3, 4, 3
result: .word 0
.text
.globl main 
.ent main 
main:
    la      $t1, vett 
    and     $t3, $0, $0         # index
    and     $t4, $0, $0         # temporary register
    lw      $t0, ($t1)          # load first element from vett
    add     $t4, $t4, $t0       #add to the temp register
    addi    $t3, $t3, 1         # update index
    addi    $t1, $t1, 4
    bne     $t3, 5, lab1        # repeat 5 times
    la      $t1, result
    sw      $t4, ($t1)          # write result to memory
    li      $v0, 10 
    syscall
.end main


# 5.legge DIM elementi di un vettore e li visualizza sulla console (schermo) in ordine inverso
.data
DIM = 5
vett:   .space DIM
.text
.globl main 
.ent main 
main:
    la      $t2, vett 
    and     $t3, $0, $0         # index

lab1:
    li      $v0, 12             # read one character
    syscall

    sb      $v0, ($t2) 
    addi    $t2, $t2, 1 
    addi    $t3, $t3, 1         # update index
    bne     $t3, 5, lab1        # repeat 5 times

lab2:
    addi    $t3, $t3, -1        # update index
    addi    $t2, $t2, -1
    lb      $a0, ($t2) 
    li      $v0, 11             # write one character
    syscall

    bne     $t3, 0, lab2        # repeat 5 times

    li $v0, 10
    syscall
.end main