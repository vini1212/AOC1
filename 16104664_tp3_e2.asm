#Fa�a um programa que calcule a seguinte equa��o:
#y = 3x2 - 5x + 13
#Armazene x no registrador $t5 com a instru��o ori $t5, $0, x, #substituindo x pelo
#valor desejado, e sempre que precisar o valor de x, utilize o #valor armazenado no
#registrador $t5.
#Armazene o resultado y no registrador $t6.
#Fa�a teste com diferentes valores positivos e negativos de x. 

ori $t5, $zero, 5 #fun��o para ser usar n�meros negativos era ADDI, ori n�o vai conseguir

#potencia de 2
mult $t5, $t5
mflo $t0

#multiplica��o por 3x
sll $t1, $t0, 1
add $t1, $t1, $t0

#multiplica��o por 5x
sll $t2, $t5, 2
add $t2, $t2, $t5

#Inserindo o valor 13
ori $t3, $zero, 13

#Resultado Final
add $t6, $zero, $t1
sub $t6, $t6, $t2
add $t6, $t6, $t3






