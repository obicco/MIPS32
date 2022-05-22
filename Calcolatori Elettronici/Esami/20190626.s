    .data
espressione:    .word 18, 25, 10, 7, -2, -3, -1, 13, -2
tabella:        .word somma, sottrazione, moltiplicazione, divisione
    .text
    .globl main
    .ent main
main:   subu    $sp, $sp, 4
        sw      $ra, ($sp)
        la      $a0, espressione
        li      $a1, 9
        jal     calcolaPolaccaInversa

        lw      $ra, ($sp)
        addu    $sp, $sp, 4
        jr      $ra
    .end main

eseguiOperazione:
        subu    $t0, $zero, $a0
        subu    $t0, $t0, 1
        sll     $t0, $t0, 2
        lw      $t1, tabella($t0)
        jr      $t1
somma:  
        addu    $v0, $a1, $a2
        b       fine
sottrazione:
        subu    $v0, $a1, $a2
        b       fine
moltiplicazione:
        mulou   $v0, $a1, $a2
        b       fine
divisione:
        divu    $v0, $a1, $a2
        b       fine
fine:   jr      $ra

calcolaPolaccaInversa:
        subu    $sp, $sp, 4
        sw      $ra, ($sp)

        move    $t5, $a0
        move    $t6, $a1

ciclo:  beqz    $t6, esci       # per ipotesi la lunghezza dell'array è > 0
        lw      $a0, ($t5)
        lb      $t9, ($t5)
        bgez    $a0, push

        lw      $a1, 4($sp)
        lw      $a2, 4($sp)
        addu    $sp, 8
        jal     eseguiOperazione
        subu    $sp, 4
        sw      $v0, ($sp)
        b       next

push:   subu    $sp, $sp, 4
        sw      $a0, ($sp)

next:   addu    $t5, 4
        subu    $t6, 1
        b       ciclo

esci:   addu    $sp, 4

        lw      $ra, ($sp)
        addu    $sp, $sp, 4
        jr      $ra
