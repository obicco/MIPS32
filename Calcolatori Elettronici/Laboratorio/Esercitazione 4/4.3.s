.data
    NUM_ELEM = 20
    DIM = 4 * NUM_ELEM
    vetrig:     .word 12, 56, 1, -5
    vetcol:     .word -51, 11, 0, 4
    matrice:    .space DIM * NUM_ELEM
.text
.globl main
.ent main
main:
    li      $t0, 0      # offset matrice 
    li      $t1, 0      # contatore righe

ciclorig:
    lw      $t3, vetrig($t1)
    li      $t2, 0      # contatore colonne

ciclocol:
    lw      $t4, vetcol($t2)
    mult    $t3, $t4
    mflo    $t4
    mfhi    $t5
    beq     $t5, $0, noOverflow
    bne     $t5, 0xFFFFFFFF, overflow
    # se la word alta e' negativa, deve esserlo anche la word bassa 
    bgtz    $t4, overflow

noOverflow:
    sw      $t4, matrice($t0)
    addi    $t0, $t0, 4
    addi    $t2, $t2, 4
    blt     $t2, DIM, ciclocol
    addi    $t1, $t1, 4
    blt     $t1, DIM, ciclorig
    j fine

overflow:   #  istruzioni per gestire overflow

fine:    
    li      $v0, 10
    syscall
    
.end main