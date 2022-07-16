####### POTENZA 2 ######## 
.data
array: .word 3, 10, 4, 3, 4, 5, 3, 7, 1, 9
msg: .asciiz "^2 = "
n: .asciiz "\n"

.text

.globl main

main:

    li $t0, 0 # index
    li $t4, 4 # Fattore di moltiplicazione

loop:

    mul $t3, $t0, $t4 # Calcola l'offset

    lw $a0, array($t3) # Carica il valore corrente dell'array
    jal pow2 # Chiamata dela funzione pow2

    move $s0, $a0
    move $s1, $v0

    # Faccio eventualmente le varie print

    addi $t0, $t0, 1 # Incremento index

    slti $t2, $t0, 10 # Controllo se $t0 < 10
    bne $t2, $zero, loop # Se < 10 riprendo il loop

    # Fine del programma
    li $v0, 10
    syscall

# FUNZIONE pow2
# Assume che l'argomento sia in $a0
# Return value sarà salvato in $v0
# Il return address è salvato in $ra (dalla jal)

pow2:
    mul $v0, $a0, $a0
    jr $ra



######## STACK ########
.data
msg: .asciiz " Fine del programma\n"

.text

.globl main

main:

    li $s0, 0x1337
    li $s1, 0x1338
    li $s2, 0x1339
    li $s3, 0x133a
    li $s4, 0x133b
    li $s5, 0x133c
    li $s6, 0x133d
    li $s7, 0x133f

    jal foo

    li $v0, 4
    la $a0, msg
    syscall

    li $v0, 10
    syscall

### Funzione foo pusha nello stack i registro $s0, $s1,... fa delle operazioni e poi li poppa back
foo:

    addi $sp, $sp, -4
    sw $s0, 0($sp)    # Push registro $s0

    addi $sp, $sp, -4
    sw $s1, 0($sp)    # Push registro $s1
    
    addi $sp, $sp, -4
    sw $s2, 0($sp)    # Push registro $s2

    addi $sp, $sp, -4
    sw $s3, 0($sp)    # Push registro $s3
    
    addi $sp, $sp, -4
    sw $s4, 0($sp)    # Push registro $s4
    
    addi $sp, $sp, -4
    sw $s5, 0($sp)    # Push registro $s5
    
    addi $sp, $sp, -4
    sw $s6, 0($sp)    # Push registro $s6
    
    addi $sp, $sp, -4
    sw $s7, 0($sp)    # Push registro $s7
    
    ### EVENTUALI OPERAZIONI

    lw $s7, 0($sp)
    addi $sp, $sp, 4   # Pop del registro $s7

    lw $s6, 0($sp)
    addi $sp, $sp, 4   # Pop del registro $s6

    lw $s5, 0($sp)
    addi $sp, $sp, 4   # Pop del registro $s5

    lw $s4, 0($sp)
    addi $sp, $sp, 4   # Pop del registro $s4

    lw $s3, 0($sp)
    addi $sp, $sp, 4   # Pop del registro $s3

    lw $s2, 0($sp)
    addi $sp, $sp, 4   # Pop del registro $s2

    lw $s1, 0($sp)
    addi $sp, $sp, 4   # Pop del registro $s1

    lw $s0, 0($sp)
    addi $sp, $sp, 4   # Pop del registro $s0

    jr $ra
    


####### RICORSIONE ########
.data
.text
.globl main

main:

    li $a0, 3   # Parametro di ricorsione
    jal rec

    li $v0, 10
    syscall

rec:

    addi $sp, $sp, -4  # Push $ra nello stack
    sw $ra, 0($sp)

    addi $sp, $sp, -4  # Push $a0 nello stack
    sw $a0, 0($sp)

    beq $a0, $zero, return # if (i == 0) return

    addi $a0, $a0, -1  # Decremento parametro

    jal rec  # Chiamata ricosiva

    # Ricorsione in coda
    li $v0, 1   # Print $a0
    syscall

    lw $a0, 0($sp)  # Pop $a0 from stack
    addi $sp, $sp, 4

    lw $ra, 0($sp)  # Pop $ra from stack
    addi $sp, $sp, 4

    jr $ra

return:

    lw $a0, 0($sp)