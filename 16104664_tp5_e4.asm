#Uma temperatura, armazenada em $t0, pode ficar em dois intervalos:
#20 ? temp ? 40 e
#60 ? temp ? 80.
#Escreva um programa que coloque uma flag (registrador $t1) para 1 se a
#temperatura est� entre os valores permitidos e para 0 caso contr�rio.
#Inicie o c�digo com a instru��o: ori $t0, $zero, temperatura, substituindo
#temperatura por um valor qualquer.


#flag
ori $t1, $zero, 1

#temperatura
ori $t0, $zero, 62

slti $t8, $t0, 20
beq $t8, $zero, dentro
sll $t0, $t0, 0

slti $t8, $t0, 60
beq $t8, $zero, dentro
sll $t0, $t0, 0

slti $t8, $t0, 41
beq $t8, $zero, fora
sll $t0, $t0, 0

slti $t8, $t0, 81
beq $t8, $zero, fora
sll $t0, $t0, 0


fora: ori $t1, $zero, 0 #troca o flag

dentro: sll $t0, $t0, 0 #mantem o flag

