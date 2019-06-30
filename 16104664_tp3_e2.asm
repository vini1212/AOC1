#Faça um programa que calcule a seguinte equação:
#y = 3x2 - 5x + 13
#Armazene x no registrador $t5 com a instrução ori $t5, $0, x, #substituindo x pelo
#valor desejado, e sempre que precisar o valor de x, utilize o #valor armazenado no
#registrador $t5.
#Armazene o resultado y no registrador $t6.
#Faça teste com diferentes valores positivos e negativos de x. 

ori $t5, $zero, 5 #função para ser usar números negativos era ADDI, ori não vai conseguir

#potencia de 2
mult $t5, $t5
mflo $t0

#multiplicação por 3x
sll $t1, $t0, 1
add $t1, $t1, $t0

#multiplicação por 5x
sll $t2, $t5, 2
add $t2, $t2, $t5

#Inserindo o valor 13
ori $t3, $zero, 13

#Resultado Final
add $t6, $zero, $t1
sub $t6, $t6, $t2
add $t6, $t6, $t3






