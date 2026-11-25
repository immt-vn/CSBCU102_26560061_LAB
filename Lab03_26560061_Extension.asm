# min_max(addr = $a0, n = $a1)
# returns min in $v0 and max in $v1

min_max:

    lw   $v0, 0($a0)      # min = first element
    lw   $v1, 0($a0)      # max = first element
    addi $t0, $zero, 1    # i = 1

mm_loop:

    slt  $t1, $t0, $a1
    beq  $t1, $zero, mm_end
    sll  $t2, $t0, 2
    add  $t2, $t2, $a0
    lw   $t3, 0($t2)

    # if element < min
    slt  $t1, $t3, $v0
    beq  $t1, $zero, check_max
    add  $v0, $t3, $zero

check_max:

    # if max < element
    slt  $t1, $v1, $t3
    beq  $t1, $zero, next
    add  $v1, $t3, $zero

next:

    addi $t0, $t0, 1
    j    mm_loop

mm_end:

    jr   $ra