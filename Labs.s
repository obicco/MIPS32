.data
.text
.globl main
    main:
        addi $t0, $t0, 8 #base
        addi $t1, $t1, 7 #altezza
        addi $t3, $t3, 1 #inizializzo contatore righe

        jal stampaTriangolo

        li $v0, 10
        syscall

    stampaTriangolo:
        li $v0, 11
        loop1:
            li $t2, 0 # inizializzo contatore colonne
                loop2:
                    li $a0, '*'
                    syscall

                    addi $t2, $t2, 1

                    bne $t2, $t3, loop2
            li $a0, '\n'
            syscall

            addi $t3, $t3, 1

            bne $t3, $t1, loop1
            
        jr $ra

#Esercitazione 7