#y = 32ab - 3a + 7b - 13

.data
    a: .word 3
    b: .word 5
    y: .space 4

.text        
lui $t0, 0x1001

lw $t1, 0($t0) #salvando o valor da posição de memoria em $t1
lw $t2, 4($t0) #salvando o valor da posição de memoria em $t1


#3a
sll $t3, $t1, 1
add $t3, $t3, $t1

#7b
ori $t4, $zero, 7
mult $t2, $t4
mflo $t4 

#32ab
mult $t1, $t2
mflo $t5
sll $t5, $t5, 5

#resultado final
add $t5, $t5, $t4
sub $t5, $t5, $t3

ori $t6, $zero, 13
sub $t5, $t5, $t6

sw $t5, 8($t0)



