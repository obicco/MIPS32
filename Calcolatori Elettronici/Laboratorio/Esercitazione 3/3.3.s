.data
    risultato:      .space 4
    giorni:         .byte 231
    ore:            .byte 16
    minuti:         .byte 47
.text
.globl main
.ent main
main:
    lbu     $t0, giorni         # conversione da giorni a ore
    mul     $t1, $t0, 24
    lbu     $t0, ore
    addu    $t1, $t1, $t0       # somma ore
    mul     $t1, $t1, 60        # conversione in minuti
    lbu     $t0, minuti 
    addu    $t1, $t1, $t0 
    sw      $t1, risultato

    li      $v0, 10
    syscall
.end main