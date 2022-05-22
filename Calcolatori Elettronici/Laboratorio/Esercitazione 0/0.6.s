.data
    DIM = 4
    wRes:           .space 20
    message_in:     .asciiz "Inserire numeri\n"
    message_out:    .asciiz "Numeri inseriti\n"
    space:          .asciiz ";"
.text
.globl main
.ent main
main:
    la		$a0, message_in
    li		$v0, 4
    syscall

    la      $t0, wRes
    li      $t1, 0

uno:
    li      $v0, 5      #Read integer
    syscall             #System call (result in $v0)
    sw      $v0, ($t0)
    beq     $t1, DIM, print_num
    add     $t1, $t1, 1
    add     $t0, $t0, 4
    j       uno

print_num:
    la      $a0, message_out
    li      $v0, 4
    syscall
    la      $t0, wRes
    li      $t1, 0      #contatore

ciclo_print:
    li $v0, 1         # call code, print int
    lw $a0, ($t0)     # value for int to print
    syscall           # system call
                
    beq   $t1, DIM, fine
    la $a0, space   
    li $v0, 4             
    syscall
    
    add $t1, $t1, 1
    add $t0, $t0, 4
    j ciclo_print
        
fine:        
    nop
                
    li $v0, 10
    syscall 
.end main
     
    