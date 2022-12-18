.data
    NUM_ELEM = 20
    DIM = 4 * NUM_ELEM
    wVet:   .space DIM
.text
.globl main
.ent main
main:
    li      $t0, 0      #contatore
    # Caricamento primi 2 valori
    li      $t1, 1
    sw      $t1, wVet($t0)
    addi    $t0, $t0, 4
    li      $t2, 1
    sw      $t2, wVet($t0)
    addi    $t0, $t0, 4
ciclo:
    add     $t3, $t1, $t2
    sw      $t3, wVet($t0)
    move    $t1, $t2
    move    $t2, $t3
    addi    $t0, $t0, 4
    blt     $t0, DIM, ciclo
    
    li      $v0, 10
    syscall
.end main