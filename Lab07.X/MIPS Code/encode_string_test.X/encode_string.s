
    lbu  $t0, 0($a0)           # loads character from the string
    beq  $t0, $zero, end       # Checks if it is the end of the string

    addi $sp, $sp, -8          # Make room on the stack for 2 registers
    sw   $a0, 0($sp)           # saves $a0
    sw   $ra, 4($sp)           # saves $ra

    j	 encode_char           # calls encoder_char function

    lw   $ra, 4($sp)           # loads previously saved $ra
    lw   $a0, 0($sp)           # loads previously saved $a0
    addi $sp, $sp, 8           # Restore stack

    sb   $v0, 0($a0)           # save the character to the new string

    addi $a0, $a0, 1           # moves to the next character
    j	 encode_string            # calls the encoder function for the character

end:
    jr $ra                     # returns the string


