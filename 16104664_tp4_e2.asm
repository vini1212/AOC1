.data 
    a: .word 3
    y: .space 4
    
.text
lui $t0, 0x1001
lw $t1, 0($t0)

#7a
ori $t2, $zero, 7
mult $t1, $t2
mflo $t2

#5a^2
mult $t1, $t1
mflo $t3

ori $t4, $zero, 5
mult $t3, $t4
mflo $t3

#9a^3
mult $t1, $t1
mflo $t5
mult $t5, $t1
mflo $t5

ori $t6, $zero, 9
mult $t5, $t6
mflo $t5

#resultado final
ori $t6, $zero, 15

add $t5, $t5, $t2
add $t5, $t5, $t6
sub $t5, $t5, $t3

sw $t5, 4($t0)








     