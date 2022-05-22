.data
    var1:     .byte 'm'
    var2:     .byte 'i'
    var3:     .byte 'p'
    var4:     .byte 's'  
    var5:     .byte 0       #carattere NULL per riconoscere il termine della stringa durante la stampa
.text                       #dichiarando in asciiz NULL viene aggiunto automaticamente
.globl main
.ent main
main:
    li      $t0, 'A'        #tra 'A' e 'a' c'è esattamente la distanza richiesta (32)
    li      $t1, 'a'        
    sub     $t0, $t0, $t1
    lb      $t1, var1       #conversione prima variabile
    add     $t1, $t1, $t0
    sb      $t1, var1
    lb      $t1, var2       #conversione seconda variabile
    add     $t1, $t1, $t0
    sb      $t1, var2
    lb      $t1, var3       #conversione terza variabile
    add     $t1, $t1, $t0
    sb      $t1, var3
    lb      $t1, var4       #conversione quarta variabile
    add     $t1, $t1, $t0
    sb      $t1, var4
    lb      $t1, var5       #conversione quinta variabile
    add     $t1, $t1, $t0
    sb      $t1, var5
    la      $a0, var1       #stampa
    li      $v0, 4
    syscall

    li      $v0, 10
    syscall
.end main