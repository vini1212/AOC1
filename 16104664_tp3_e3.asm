#Fa�a um programa que calcule a seguinte equa��o:
#y = 9x + 7 / 2x + 8
#Armazene x em $t1, com a instru��o ori $t1, $0, x, substituindo x pelo valor
#desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
#registrador $t1.
#Armazene o quociente da divis�o em $t2 e o resto em $t3.
#Responda o que acontece quando x = -4.

addi $t1, $zero, -4 #fun��o para colocar n�mero negativos � ADDI, ori n�o vai conseguir executar
#Resolvendo a equa��o 9x + 7
sll $t3, $t1, 3
add $t3, $t3, $t1

ori $t4, $zero, 7

add $t5, $t4, $t3 #Soma de 9x + 7

#Resolvendo a equa��o 2x + 8
sll $t6, $t1, 1
ori $t7, $zero, 8

add $t7, $t6, $t7 #soma entra 2x + 8

#Resolvendo a divis�o entre os resultados
div $t5, $t7
mfhi $t3
mflo $t2

#O valor de -4 nao vai dar e ir� aparecer valores de resto e quociente 0, pois far� uma divis�o por 0(-29/0), n�o sendo possivel representar o valor. N�o aparecendo nada no hi e no lo

