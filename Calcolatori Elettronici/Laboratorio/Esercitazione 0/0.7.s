.data
    DIM = 4
    wVet:         .space    20
    wRes:         .space    4
    message_in:     .asciiz "Inserire numeri\n"
    message_out:    .ascii "Valore minimo : "
.text
.globl main
.ent main
main:
    la $t0, wVet
    li $t1, 0                 # contatore

    la $a0, message_in    
    li $v0, 4             
    syscall               
  
uno: 
    li  $v0, 5                # Read integer
    syscall                   # system call (result in $v0)
    sw  $v0, ($t0)
    beq $t1, DIM, calc
    add $t1, $t1, 1
    add $t0, $t0, 4
    j   uno

calc:
    la  $t0, wVet
    li  $t1, 0                # contatore
    lw  $t2, ($t0)            # $t2 memorizzo MIN
        
loop_min:
    beq $t1, DIM, print_num
    lw  $t3, ($t0)
    blt $t3, $t2, change_min
    add $t1, $t1, 1
    add $t0, $t0, 4
    j   loop_min
        
change_min:
   lw  $t2, ($t0)
    j   loop_min
        
print_num:
    la $a0, message_out   # addr of NULL
    li $v0, 4             # call code, print
    syscall               # system call

    li    $v0, 1          # call code, print int
    move  $a0, $t2        # value for int to print
    syscall               # system call

fine:
    nop

    li $v0, 10
    syscall 
.end main 