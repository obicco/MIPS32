#20190626
.data
    espressione: .word 18, 25, 10, 7, -2, -3, -1, 13, -2
    tabella: .word somma, sottrazione, moltiplicazione, divisione
.text
.globl main
.ent main
    main:
        subu $sp, $sp, 4
        sw $ra, ($sp)
        la $a0, espressione
        li $a1, 9 #dimensione vettore
        jal calcolaPolaccaInversa

        lw $ra, ($sp)
        addu $sp, $sp, 4
        jr $ra
        .end main

    eseguiOperazione:
        subu $t0, $zero, $a0
        subu $t0, $t0, 1
        sll $t0, $t0, 2
        lw $t1, tabella($t0)
        jr $t1
    somma:
        addu $v0, $a1, $a2
        b fine
    sottrazione:
        subu $v0, $a1, $a2
        b fine
    moltiplicazione:
        mulou $v0, $a1, $a2
        b fine
    divisione:
        divu $v0, $a1, $a2
        b fine
    fine:
        jr $ra

    calcolaPolaccaInversa:
        subu $sp, $sp, 4
        sw $ra, ($sp)

        move $t5, $a0
        move $t6, $a1
    ciclo:
        beqz $t6, esci
        lw $a0, ($t5)
        lb $t9, ($t5)
        bgez $a0, push

        lw $a1, 4($sp)
        lw $a2, ($sp)
        addu $sp, 8
        jal eseguiOperazione
        subu $sp, 4
        sw $v0, ($sp)
        b next
    push:
        subu $sp, $sp, 4
        sw $a0, ($sp)
    next:
        addu $t5, 4
        subu $t6, 1
        b ciclo
    esci:
        addu $sp, 4
        lw $ra, ($sp)
        addu $sp, $sp, 4
        jr $ra

#20200701
    DIM = 11
.data
    veta: .word 2, 14, 8, 54, 0, 42, 9, 24, 0, 91, 23
    vetb: .byte 4*DIM
.text
.globl main
.ent main
    main:
        la $a0, veta
        la $a1, vetb
        li $a2, DIM
        jal media

    media:
        move $t0, $a0
        move $t1, $a1
        move $t2, $a2
        ble $a2, 3, copia

        li $t3, 3
        lw $s0, ($t0)
        sw $s0, ($t1)
        addi $t0, $t0, 4
        addi $t1, $t1, 4
        lw $s0, ($t0)
        sw $s0, ($t1)
        addi $t0, $t0, 4
        addi $t1, $t1, 4

    loop: 
          subu  $sp,$sp,4
          sw    $t0, ($sp)
          subu  $t0, $t0, 8
          lw    $s0, ($t0)
          addi  $t0, $t0, 4
          lw    $s1, ($t0)
          addi  $t0, $t0, 4
          lw    $s2, ($t0)
          addi  $t0, $t0, 4
          lw    $s3, ($t0)
          addu  $s1, $s1, $s0
          addu  $s2, $s2, $s1
          addu  $s3, $s3, $s2
          divu  $s3, $s3, 4
          sw    $s3, ($t1)        # Valore calcolato MEMORIZZATO in VETB
          
          lw    $t0, ($sp)
          addi  $sp, $sp, 4
          
          # Test se siamo a DIM-1        
          addi $t3, $t3, 1
          beq   $t3, $t2, tre_1
          addu  $t0, $t0, 4       # Incremento puntatore VETA
          addu  $t1, $t1, 4       # Incremento puntatore VETB
          j loop
        
        j fine


    copia:
        lw $s0, ($t0)
        sw $s0, ($t1)
        beq $t2, 1, fine
        addi  $t0, $t0, 4
        addi  $t1, $t1, 4
        lw  $s0, ($t0)
        sw  $s0, ($t1)
        beq $t2, 2, fine
    copia_1:
        addi  $t0, $t0, 4
        addi  $t1, $t1, 4
        lw  $s0, ($t0)
        sw  $s0, ($t1)   
        j fine
   
    fine:
        jr $ra
   .end media

#20200901
.data
    stringa1: .asciiz "Calcolatori Elettronici 2019/2020"
    stringa1: .asciiz "ALTO o basso"
.text
.globl main
.ent main
    main:
        subu $sp, $sp, 4
        sw $ra, ($sp)

        la $a0, stringa1
        la $a1, stringa2
        jal cercaSequenza

        lw $ra, ($sp)
        addiu $sp, $sp, 4

        jr $ra
    .end main

    cercaSequenza:
        