# Init code
.data
.text
.globl main
    main:

        li $v0, 10
        syscall

# YT 3 - print Hello World
.data
    myMessage: .asciiz "Hello World \n"
.text
.globl main
    main:
        li $v0, 4
        la $a0, myMessage
        syscall

        li $v0, 10
        syscall

# YT 4 - print a character
.data
    myCharacter: .byte 'm'
.text
.globl main
    main:
        li $v0, 4
        la $a0, myCharacter
        syscall

        li $v0, 10
        syscall

# YT 5 - print a integer
.data
    age: .word 24
.text
.globl main
    main:
        li $v0, 1
        lw $a0, age
        syscall

        li $v0, 10
        syscall

# YT 6 - print a float
.data
    PI: .float 3.14
.text
.globl main
    main:
        li $v0, 2
        lwc1 $f12, PI
        syscall

        li $v0, 10
        syscall

# YT 7 - print a double
.data
    myDouble: .double 7.202
    zeroDouble: .double 0.0
.text
.globl main
    main:
        ldc1 $f2, myDouble
        ldc1 $f0, zeroDouble

        li $v0, 3
        add.d $f12, $f2, $f0
        syscall

        li $v0, 10
        syscall

# YT 8 - addition with integers
.data
    n1: .word 5
    n2: .word 10
.text
.globl main
    main:
        lw $t0, n1
        lw $t1, n2

        add $a0, $t0, $t1
        li $v0, 1
        syscall

        li $v0, 10
        syscall

# YT 9 - substaction with integers
.data
    n1: .word 20
    n2: .word 8
.text
.globl main
    main:
        lw $s0, n1  # s0 = 20
        lw $s1, n2  # s1 = 8

        sub $t0, $s0, $s1   # t0 = 20 - 8

        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 10
        syscall

# YT 10 - multiplying (mul)
.data
.text
.globl main
    main:
        addi $s0, $zero, 10
        addi $s1, $zero, 4 
        mul $t0, $s0, $s1  # you can only multiply two 16bits numbers

        li $v0, 1
        add $a0, $zero, $t0
        syscall

        li $v0, 10
        syscall

# YT 11 - multiplying (mult)
.data
.text
.globl main
    main:
        addi $t0, $zero, 2000
        addi $t1, $zero, 10

        mult $t0, $t1  # the result is in register lo and hi (more than 16bit)

        mflo $s0 # move from lo to s0

        li $v0, 1
        add $a0, $zero, $s0
        syscall

        li $v0, 10
        syscall

# YT 12 - multiplying (sll)
.data
.text
.globl main
    main:
        addi $s0, $zero, 4
        sll $t0, $s0, 2 #moltiplica $s0 per 2^2 = 4, fosse 3, sarebbe 2^3 = 8

        li $v0, 1
        add $a0, $zero, $t0
        syscall

        li $v0, 10
        syscall

# YT 13 - division (div - 3 arguments)
.data
.text
.globl main
    main:
        addi $t0, $zero, 30
        addi $t1, $zero, 5

        div $s0, $t0, $t1

        li $v0, 1
        add $a0, $zero, $s0
        syscall

        li $v0, 10
        syscall

# YT 14 - division (div - 2 arguments)
.data
.text
.globl main
    main:
        addi $t0, $zero, 30
        addi $t1, $zero, 8

        div $t0, $t1

        mflo $s0
        mfhi $s1  #resto

        li $v0, 1
        add $a0, $zero, $s0
        syscall

        add $a0, $zero, $s1
        syscall

        li $v0, 10
        syscall

# YT 15 - Functions
.data
    message: .asciiz "Hi everybody. My name is Bicco.\n"
.text
.globl main
    main:
        jal displayMessage

        addi $s0, $zero, 5
        li $v0, 1
        add $a0, $zero, $s0
        syscall

        li $v0, 10
        syscall

    displayMessage:
        li $v0, 4
        la $a0, message
        syscall

        jr $ra

# YT 16 - Function arguments and return values
.data
    
.text
.globl main
    main:
        addi $a1, $zero, 50
        addi $a2, $zero, 100

        jal addNumbers

        li $v0, 1
        addi $a0, $v1, 0
        syscall

        li $v0, 10
        syscall

    addNumbers: # to give arguments use $a registers, retuns in $v registers
        add $v1, $a1, $a2 

        jr $ra

# YT 17 - Saving registers to the stack
.data
    newLine: .asciiz "\n"
.text
.globl main
    main:
        addi $s0, $zero, 10

        jal increaseMyRegister

        li $v0, 4
        la $a0, newLine
        syscall

        li $v0, 1
        move $a0, $s0
        syscall


        li $v0, 10
        syscall
    
    increaseMyRegister:
        addi $sp, $sp, -4
        sw $s0, 0($sp)

        addi $s0, $s0, 30

        li $v0, 1
        move $a0, $s0
        syscall

        lw $s0, 0($sp)
        addi $sp, $sp, 4

        jr $ra

# YT 18 - Nested procedures
.data
    newLine: .asciiz "\n"
.text
.globl main
    main:
        addi $s0, $zero, 10

        jal increaseMyRegister

        li $v0, 4
        la $a0, newLine
        syscall

        jal printTheValue

        li $v0, 10
        syscall
    
    increaseMyRegister:
        addi $sp, $sp, -8
        sw $s0, 0($sp)

        sw $ra, 4($sp) #salvo l'indirizzo

        addi $s0, $s0, 30

        jal printTheValue # nasted procedure (funzione dentro funzione), devo prima salvare l'indirizzo di ritorno!

        lw $s0, 0($sp)
        lw $ra, 4($sp)
        addi $sp, $sp, 8

        jr $ra

    printTheValue:
        li $v0, 1
        move $a0, $s0
        syscall
        
        jr $ra

# YT 19 - User input integers
.data
    prompt: .asciiz "Enter your age: "
    message: .asciiz "\nYour age is "
.text
.globl main
    main:
        li $v0, 4   #prompt
        la $a0, prompt
        syscall

        li $v0, 5   #user input
        syscall

        move $t0, $v0   #store user input

        li $v0, 4
        la $a0, message
        syscall

        li $v0, 1
        move $a0, $t0
        syscall

        li $v0, 10
        syscall

# YT 20 - User input floats
.data
    prompt: .asciiz "Enter the value of PI: "
    zeroAsFloat: .float 0.0
    message: .asciiz "\nPI value is "
.text
.globl main
    main:
        lwc1 $f4, zeroAsFloat

        li $v0, 4
        la $a0, prompt
        syscall

        li $v0, 6
        syscall

        li $v0, 4
        la $a0, message
        syscall

        li $v0, 2
        add.s $f12, $f0, $f4
        syscall

        li $v0, 10
        syscall

# YT 21 - User input doubles
.data
    prompt: .asciiz "Enter the value of e: "
    message: .asciiz "\ne value is "
.text
.globl main
    main:
        li $v0, 4
        la $a0, prompt
        syscall

        li $v0, 7
        syscall

        li $v0, 4
        la $a0, message
        syscall

        li $v0, 3
        add.d $f12, $f0, $f10 #every $f register is initialized to 0.0, so I'm using a random $f10 that I know is not occupated
        syscall

        li $v0, 10
        syscall

# YT 22 - User input text
.data
    prompt: .asciiz "Hello, "
    userInput: .space 20 #hold 20 characthers (spaces = bytes)
.text
.globl main
    main:
        li $v0, 8   #get user input as text
        la $a0, userInput
        li $a1, 20
        syscall

        li $v0, 4
        la $a0, prompt
        syscall

        li $v0, 4
        la $a0, userInput
        syscall

        li $v0, 10
        syscall

# YT 23 - If statements
.data
    message: .asciiz "The numbers are equal"
    error: .asciiz "Nothing happened"
.text
.globl main
    main:
        addi $t0, $zero, 5
        addi $t1, $zero, 20

        beq $t0, $t1, numbersEqual
        #beq --> branch if equal
        #bne --> branch if not equal
        #b --> branch whatever

        li $v0, 4
        la $a0, error
        syscall

        li $v0, 10
        syscall

    numbersEqual:
        li $v0, 4
        la $a0, message
        syscall

        li $v0, 10 #end the program to not execute further actins
        syscall

# YT 24 - If less than
.data
    message: .asciiz "The number is less than the other"
.text
.globl main
    main:
        addi $t0, $zero, 1
        addi $t1, $zero, 200

        slt $s0, $t0, $t1
        bne $s0, $zero, printMessage

        li $v0, 10
        syscall

    printMessage:
        li $v0, 4
        la $a0, message
        syscall

        li $v0, 10 #end the program to not execute further actins
        syscall

# YT 25 - Branching pseudo instructions
.data
    message: .asciiz "Hi! How are you?"
.text
.globl main
    main:
        addi $s0, $zero, 14
        addi $s1, $zero, 10

        bgt $s0, $s1, printMessage
        #blt --> branch if less than
        #bgt --> branch if greater than
        #bgtz --> branch if greater than zero (one register and the label)

        li $v0, 10
        syscall

    printMessage:
        li $v0, 4
        la $a0, message
        syscall

        li $v0, 10 #end the program to not execute further actins
        syscall
        
# YT 26 - While loop
.data
    message: .asciiz "After while loop is done"
    space: .asciiz " "
.text
.globl main
    main:
        addi $t0, $zero, 0

    while:
        bgt $t0, 10, exit
        jal printNumber
        addi $t0, $t0, 1

        j while

    exit:
        li $v0, 4
        la $a0, message
        syscall

        li $v0, 10
        syscall

    printNumber:
        li $v0, 1
        add $a0, $t0, $zero
        syscall

        li $v0, 4
        la $a0, space
        syscall

        jr $ra

# YT 27 - Arrays
.data
    array: .space 12 # 3 integers * bytes = 12 spaces
.text
.globl main
    main:
        addi $s0, $zero, 4
        addi $s1, $zero, 10
        addi $s2, $zero, 12

        addi $t0, $zero, 0 #index

        sw $s0, array($t0)
        addi $t0, $t0, 4
        sw $s1, array($t0)
        addi $t0, $t0, 4
        sw $s2, array($t0)

        lw $t6, array($zero)  #print first element
        li $v0, 1
        addi $a0, $t6, 0
        syscall

        li $v0, 10
        syscall

# YT 28 - Print array in while loop
.data
    array: .space 12 # 3 integers * bytes = 12 spaces
    newLine: .asciiz "\n"
.text
.globl main
    main:
        addi $s0, $zero, 4
        addi $s1, $zero, 10
        addi $s2, $zero, 12

        addi $t0, $zero, 0 #index

        sw $s0, array($t0)
        addi $t0, $t0, 4
        sw $s1, array($t0)
        addi $t0, $t0, 4
        sw $s2, array($t0)

        addi $t0, $zero, 0 #clear index

    printArray:
        beq $t0, 12, exit
        
        lw $t6, array($t0)
        li $v0, 1
        move $a0, $t6
        syscall

        li $v0, 4
        la $a0, newLine
        syscall

        addi $t0, $t0, 4
        j printArray

    exit:
        li $v0, 10
        syscall  

# YT 29 - Array initilizer declaration
.data
    array: .word 100:3 # 3 elements initialized to 100
    newLine: .asciiz "\n"
.text
.globl main
    main:

    while:
        beq $t0, 12, exit
        
        lw $t6, array($t0)
        li $v0, 1
        move $a0, $t6
        syscall

        li $v0, 4
        la $a0, newLine
        syscall

        addi $t0, $t0, 4
        j while

    exit:
        li $v0, 10
        syscall  

# YT 30 - Floating point arithmetic
.data
    number1: .float 3.14
    number2: .float 2.71
    n1: .double 3.14
    n2: .double 2.71
.text
.globl main
    main:
        lwc1 $f2, number1
        lwc1 $f4, number2

        ldc1 $f6, n1  #doubles need two register to be saved, so the space taken is f6 & f7
        ldc1 $f8, n2  #doubles need two register to be saved, so the space taken is f8 & f9

        add.s $f12, $f2, $f4
        add.d $f10, $f6, $f8

        li $v0, 10
        syscall
        
# YT 31 - More on floating poin arithmetic
.data
    number1: .float 3.00
    number2: .float 2.00
    n1: .double 3.00
    n2: .double 2.00
.text
.globl main
    main:
        lwc1 $f2, number1
        lwc1 $f4, number2

        ldc1 $f6, n1  #doubles need two register to be saved, so the space taken is f6 & f7
        ldc1 $f8, n2  #doubles need two register to be saved, so the space taken is f8 & f9

        mul.s $f12, $f2, $f4 #also div.s
        mul.d $f10, $f6, $f8 #also div.d

        li $v0, 10
        syscall
        
# YT 32 - If statements with floats and doubles
.data
    message: .asciiz "It was true\n"
    message2: .asciiz "It was false\n"
    n1: .float 10.4
    n2: .float 4.6
.text
.globl main
    main:
        lwc1 $f0, n1
        lwc1 $f2, n2

        c.eq.s $f0, $f2

        bc1t exit

        li $v0, 4
        la $a0, message2
        syscall

        li $v0, 10
        syscall

    exit:
        li $v0, 4
        la $a0, message
        syscall
        
        jr $ra
        
# YT 34 - Recursion (factorial)
.data
    promptMessage: .asciiz "Enter a number to find its factorial: "
    resultMessage: .asciiz "\nThe factorial of the number is "
    theNumber: .word 0
    theAnswer: .word 0
.text
.globl main
    main:
        li $v0, 4
        la $a0, promptMessage
        syscall

        li $v0, 5
        syscall

        sw $v0, theNumber

        lw $a0, theNumber
        jal findFactorial
        sw $v0, theAnswer

        li $v0, 4
        la $a0, resultMessage
        syscall

        li $v0, 1
        lw $a0, theAnswer
        syscall

        li $v0, 10
        syscall

    findFactorial:
        subu $sp, $sp, 8
        sw $ra, ($sp)
        sw $s0, 4($sp)

        li $v0, 1 #base case
        beq $a0, 0 factorialDone

        move $s0, $a0 #if not base case substract 1 from the argument
        sub $a0, $a0, 1
        jal findFactorial

        mul $v0, $s0, $v0 #Calculation of values when recursion rewinding

    factorialDone:
        lw $ra, ($sp)
        lw $s0, 4($sp)
        addu $sp, $sp, 8

        jr $ra
        
# YT 35 - Bit Manipulation (clearBitZero)
#takes its parameter value, clears bit zero in that value, and returns the result
.data
    newLine: .asciiz "\n"
.text
.globl main
    main:
        li $a1, 11
        jal showNumber

        li $a1, 11
        jal clearBitZero

        move $a1, $v0
        jal showNumber

        li $v0, 10
        syscall

    showNumber:
        li $v0, 4
        la $a0, newLine
        syscall

        li $v0, 1
        move $a1, $a1
        syscall

        jr $ra

    clearBitZero:
        addi $sp, $sp, -4
        sw $s0, 0($sp)

        li $s0, -1
        sll $s0, $s0, 1 #make the mask
        and $v0, $a1, $s0

        lw $s0, 0($s0)
        addi $sp, $sp, 4

        jr $ra
        
# YT 36 - Average program
.data
    array: .word 10, 2, 9
    lenght: .word 3
    sum: .word 0
    average: .word 0
.text
.globl main
    main:
        la $t0, array
        li $t1, 0 #index
        lw $t2, lenght
        li $t3, 0 #sum

    sumLoop:
        lw $t4, ($t0) # $t4 = array[i]
        add $t3, $t3, $t4 #sum

        add $t1, $t1, 1 #i++
        add $t0, $t0, 4 #updating array address
        blt $t1, $t2, sumLoop #while i < lenght

        sw $t3, sum

        div $t5, $t3, $t2
        sw $t5, average

        li $v0, 1
        move $a0, $t3
        syscall

        li $v0, 10
        syscall
        
# YT 38 - 2D array
.data
    mdArray: .word 2, 5
             .word 3, 7
    size: .word 2
.text
.globl main
    main:
        la $a0, mdArray
        lw $a1, size
        jal sumDiagonal
        move $a0, $v0
        li $v0, 1
        syscall

        li $v0, 10
        syscall

    sumDiagonal:
        li $v0, 0 #sum
        li $t0, 0 #index
        li $t3, 4 #DATA_SIZE

    sumLoop:
        mul $t1, $t0, $a1 #t1 = rowIndex * colSize
        add $t1, $t1, $t0 # mul result + colIndex
        mul $t1, $t1, $t3 # add result * DATA_SIZE
        add $t1, $t1, $a0 # mul reuslt + baseAddress

        lw $t2, ($t1)
        add $v0, $v0, $t2 #sum

        addi $t0, $t0, 1 #i++
        blt $t0, $a1, sumLoop #while i < size

        jr $ra
