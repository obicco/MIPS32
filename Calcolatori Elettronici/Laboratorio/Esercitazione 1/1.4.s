.data
    var:      .word 0x3FFFFFF0
.text
.globl main
.ent main
main:
    lw		$t0, var

    add     $t1, $t0, $t0   #prima somma
    move    $a0, $t1
    li      $v0, 1
    syscall

    addiu   $a0, $t1, 40    #seconda somma
    li      $v0, 1
    syscall

    #addi   $a0, $t1, 40  #scatena l'eccezione di overflow
    #li     $v0, 1
    #syscall

    li      $t2, 40         #terza somma
    addu    $a0, $t1, $t2
    li      $v0, 1
    syscall

    #add    $a0, $t1, $t2 #scatena l'eccezione di overflow
    #li     $v0, 1
    #syscall

    li      $v0, 10
    syscall
.end main