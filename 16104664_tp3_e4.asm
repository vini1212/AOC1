#Fa�a um programa que calcule a �rea do tri�ngulo equil�tero abaixo e escreva o
#resultado em $t3.
#Armazene b em $t1 e h em $t2 utilizando as instru��es ori $t1, $0, b e ori $t2, $0, h,
#substituindo b e h pelos valores desejados, e sempre que precisar de b e h, utilize os
#valores armazenados nos registradores $t1 e $t2.

#Armazenando os valor b e h

ori $t1, $zero, 3 #valor b

ori $t2, $zero, 6 #valor h

#fazendo a multiplica��o de b x h
mult $t1, $t2
mflo $t3

#fazendo a Area final do triangulo
ori $t4, $zero, 2 #Esse valor j� � escrito da equa��o

div $t3, $t4
mflo $t3 #quociente da divis�o entre b.h/2

