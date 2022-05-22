.data
    opa:    .word 2043
    opb:    .word 5
    res:    .space 4
    tab:    .word somma, sottrazione, moltiplic, divisione
.text
.globl main
.ent main
main:
    lw      $t0, opa lw $t1, opb
    li      $v0, 5
    syscall
    blt     $v0, 0, errore
    bgt     $v0, 3, errore
    sll     $t2, $v0, 2
    lw      $t2, tab($t2)
    jr $t2

somma:
    add     $t0, $t0, $t1
    b fine

sottrazione:
    sub     $t0, $t0, $t1
    b fine

moltiplic:
    mul     $t0, $t0, $t1
    b fine

divisione:
    div     $t0, $t0, $t1
    b fine

errore:     # gestione errore
    b fine2

fine:
    sw      $t0, res

fine2:
    li      $v0, 10
    syscall
    
.end main