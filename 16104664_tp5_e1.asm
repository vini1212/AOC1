#Escreva um programa que leia dois halfwords (a e b) da mem�ria e calcule a sua
#divis�o se os dois valores forem diferentes e a sua multiplica��o se os dois valores
#forem iguais. Escreva o resultado (y) em uma palavra (4 bytes) de mem�ria. O
#resultado deve ser armazenado, obrigatoriamente, na posi��o 0x10010004 da
#mem�ria .data.

.data
   a: .half 5
   b: .half 5
   y: .space 4
   
.text

lui $t0, 0x1001
lh $t1, 0($t0)
lh $t2, 2($t0)

beq $t1, $t2, Else
div $t2, $t1
mflo $t3
j Exit

Else: mult $t1, $t2
mflo $t3

Exit: 
sw $t3, 4($t0)

