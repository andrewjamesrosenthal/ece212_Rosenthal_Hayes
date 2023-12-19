    li   $t0, 'A'              # set $t0 to A
    slt  $a0, $t0, $ra	       # if $t0 < A return $t0
    li   $t0, 'Z'              # change $t0 to Z
    slt  $t0, $a0, $ra         # if Z>$t0 returns $t0

    sub  $t1, $a0, 'A'         # Subtracts 'A' from the character
    sub  $t1, $t1, $a1         # Shifts it by a value of 'k'
    addi $t1, $t1, 26          # adds 26 to character
    div  $t1, $t1, 26          # divides by 26
    mfhi $t1                   # gets the remainder for rap around

    add  $v0, $t1, 'A'         # adds value 'A'
    return_char:
    jr $ra                     # return new value

j return_char              # ends and goes to return the value

    jr $ra                     # return new value


