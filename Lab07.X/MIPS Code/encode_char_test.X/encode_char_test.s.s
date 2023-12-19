###########################################################################
#
#    ECE 212 Lab 7 - Fall 2023
#    encode_char test file
#
########################################################################### 
 
    .set noreorder
    .global main             # define main as a global label
    .text
main: 
    addi $a0, $0, 'A'        # put character to encode in $a0
    addi $a1, $zero, 22       # put character shift amount in arg reg $a1
    jal  encode_char         # call the function
    add  $0, $0, $0          # branch delay slot nop
encode_another:
    addi $a0, $0, 'Z'        # put character to encode in $a0
    addi $a1, $zero, 22       # put character shift amount in arg reg $a1
    jal  encode_char         # call the function
    add  $0, $0, $0          # branch delay slot nop
done:  
    j done                   # infinite loop
    add $0, $0, $0           # branch delay slot

###########################################################################
#
#    Add your encode_char assembly code below this comment
encode_char:
    sub   $t1, $a0, 'A'        # Subtract 'A' from the input character
    add   $t1, $t1, $a1        # Add the shift amount
    rem   $t1, $t1, 26         # Calculate the remainder when divided by 26
    addi  $t1, $t1, 'A'        # Add 'A' back to get the encoded character
    move  $v0, $t1             # Move the result to $v0
    jr    $ra                  # Return from subroutine

    return_char:
    jr $ra                     # return new value



#
###########################################################################
    






