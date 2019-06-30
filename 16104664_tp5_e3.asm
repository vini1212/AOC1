#Escreva um programa que leia um valor x > 0 da memória (posição 0x10010000) e
#calcule o x-ésimo termo da série de Fibonacci:
#1, 1, 2, 3, 5, 8, 13, 21, 34, 55, ...
#Escreva o x-ésimo termo da série (y) em uma palavra (4 bytes) de memória. O
#resultado deve ser armazenado, obrigatoriamente, na posição 0x10010004 da
#memória .data. Inicie o código com:

.data
x: .word 7
y: .space 4

.text

lui $t0, 0x1001
lw $t1, 0($t0)

ori $t2, $zero, 1 #contador
ori $t3, $zero, 1 #soma
ori $t4, $zero, 0 #fib1
ori $t5, $zero, 1 #fib2

teste: beq $t1, $t2, fim
sll $t0, $t0, 0
add $t3, $t4, $t5
add $t4, $t5, $zero
add $t5, $t3, $zero
addiu $t2, $t2, 1
j teste

sll $t0, $t0, 0
fim: sw $t3, 4($t0)

