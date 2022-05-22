.data
    v0:      .word 1249
    v1:      .word 2198
    v2:      .word -968
.text
.globl main
.ent main
main:
    lw $t0, v0
    lw $t1, v1
    lw $t2, v2
    blt $t0, $t1,
    move $t3, $t0
    move $t0, $t1
    move $t1, $t3
salto1:   
    blt $t0, $t2,
    move $t3, $t0
    move $t0, $t2
    move $t2, $t3
salto2:   
    blt $t1, $t2,
    move $t3, $t1
    move $t1, $t2
    move $t2, $t3
salto3:
    move $a0, $t0 
    li $v0, 1 
    syscall
    li $a0, '\n' 
    li $v0, 11 syscall
    move $a0, $t1 li $v0, 1 
    syscall
    li $a0, '\n' 
    li $v0, 11 
    syscall
    move $a0, $t2 
    li $v0, 1 
    syscall
    li $a0, '\n' 
    li $v0, 11 
    syscall

    li $v0, 10 
    syscall 
.end main