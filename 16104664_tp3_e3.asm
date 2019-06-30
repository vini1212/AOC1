#Faça um programa que calcule a seguinte equação:
#y = 9x + 7 / 2x + 8
#Armazene x em $t1, com a instrução ori $t1, $0, x, substituindo x pelo valor
#desejado, e sempre que precisar o valor de x, utilize o valor armazenado no
#registrador $t1.
#Armazene o quociente da divisão em $t2 e o resto em $t3.
#Responda o que acontece quando x = -4.

addi $t1, $zero, -4 #função para colocar número negativos é ADDI, ori não vai conseguir executar
#Resolvendo a equação 9x + 7
sll $t3, $t1, 3
add $t3, $t3, $t1

ori $t4, $zero, 7

add $t5, $t4, $t3 #Soma de 9x + 7

#Resolvendo a equação 2x + 8
sll $t6, $t1, 1
ori $t7, $zero, 8

add $t7, $t6, $t7 #soma entra 2x + 8

#Resolvendo a divisão entre os resultados
div $t5, $t7
mfhi $t3
mflo $t2

#O valor de -4 nao vai dar e irá aparecer valores de resto e quociente 0, pois fará uma divisão por 0(-29/0), não sendo possivel representar o valor. Não aparecendo nada no hi e no lo

