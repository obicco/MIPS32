# Recursive factorial program (incomplete but comments)
#######################
# Factorial procedure #
#######################
fact:   li      $t0, 2
        bge     $a0, $t0, recurse       # if n >= 2 go to recurse

        # if n <= 1, return 1
        li      $v0, 1                  # set value register to 1
        jr      $ra

        # if n>= then recursion is needed
recurse:
        # save parameters to the stack
        addi    $sp, $sp, -8            # adjust stack for 2 items
        sw      $ra, 4($sp)             # save the return address
        sw      $a0, 0($sp)             # save my argument n

        # call factorial again with n = n-1
        addi    $a0, $a0, -1            # decrement n by 1
        jal     fact

        # once finished...
        lw      $a0, 0($sp)             # restore my argument n
        lw      $ra, 4($sp)             # restore the return address
        addi    $sp, $sp, 8             # pop two items off the stack

        mul     $v0, $v0, $a0           # result = fact(n-1) * n

        jr      $ra                     # return to caller

#######################################################################
# GENERIC TEST SUITE #
#######################################################################

main:   addi    $sp, $sp, -4            # make space for $ra on stack
        sw      $ra, 0($sp)             # store the return address on the stack

#######################################################################
# Functionality Tests #
#######################################################################
        # Test #1
        # 0! = 1
        ###############################################################
        jal     setSavedRegisters
        li      $a0, 0
        jal     fact

        move    $a0, $v0
        li      $a1, 1
        li      $a2, 1
        la      $a3, test1
        jal     Assert_Equal_Integer
        .data
test1:  .asciiz "Testing 0! = 1.\n"
        .text

        # Test #2
        # 1! = 1
        ###############################################################
        jal     setSavedRegisters
        li      $a0, 1
        jal     fact

        move    $a0, $v0
        li      $a1, 1
        li      $a2, 2
        la      $a3, test2
        jal     Assert_Equal_Integer
        .data
test2:  .asciiz "Testing 1! = 1.\n"
        .text

#######################################################################
# Error Cheching Tests #
        li      $v0, 4
        la      $a0, nl
        syscall
        la      $a0, type2
        syscall
#######################################################################


#######################################################################
# All Test Completed #
Skip_Parameter_Validation_Tests:
        .data
type1:  .asciiz "--------Starting functionality tests--------\n"
type2:  .asciiz "--------Starting parameter checking tests--------\n"
finish: .asciiz "--------Testing completed--------\n"
        .text
        li      $v0, 4
        la      $a0, finish
        syscall
        lw      $ra, 0($sp)             # load return address
        addi    $sp, $sp, 4             # pop the stack
        jr      $ra