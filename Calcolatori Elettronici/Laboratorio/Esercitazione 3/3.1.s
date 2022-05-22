.data
    messageInput:   .asciiz "Inserisci un numero: "
    messageError:   .asciiz "\nL'input non è un numero valido"
    messageOk:      .asciiz "L'input è corretto."
    messageEmpty:   .asciiz "Non è stato inserito nessun numero!"
.text
.globl main
.ent main
main:
    la      $a0, messageInput
    li      $v0, 4
    syscall
    move    $t0, $0         #contatore numero di caratteri letti

loop:
    li      $v0, 12         #lettura di un carattere
    syscall 
    beq     $v0, '\n', exitLoop 
    blt     $v0, '0', notANumber 
    bgt     $v0, '9', notANumber 
    addi    $t0, $t0, 1
    b loop

exitLoop:
    beq     $t0, 0, noInput 
    la      $a0, messageOk
    b printMessage

noInput:
    la      $a0, messageEmpty 
    b printMessage

notANumber:
    la      $a0, messageError

printMessage:
    li      $v0, 4
    syscall

    li      $v0, 10
    syscall
.end main