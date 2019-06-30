#y = - ax4 + bx3 - cx2 + dx - e

.data
a: .word -3
b: .word 7
c: .word 5
d: .word -2
e: .word 8
x: .word 4
y: .space 4

.text

lui $t0, 0x1001
lw $t1, 0($t0)
lw $t2, 4($t0)
lw $t3, 8($t0)
lw $t4, 12($t0)
lw $t5, 16($t0)
lw $t6, 20($t0)

#dx
mult $t4, $t6
mflo $t4

#cx^2
mult $t6, $t6
mflo $t7

mult $t3, $t7
mflo $t3

#bx^3
mult $t6, $t6
mflo $t7 

mult $t6, $t7
mflo $t7

mult $t2, $t7
mflo $t2

#ax^4
mult $t6, $t6
mflo $t7 

mult $t6, $t7
mflo $t7

mult $t6, $t7
mflo $t7

mult $t1, $t7
mflo $t1

#RESULTADO FINAL
sub $t7, $zero, $t1
add $t7, $t7, $t2
sub $t7, $t7, $t3
add $t7, $t7, $t4
sub $t7, $t7, $t5

sw $t7, 24($t0)




