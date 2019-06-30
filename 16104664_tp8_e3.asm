ori $s0, $zero, 3 #divisao por 3 da media

#entra com os valores para media
li $v0, 5
syscall

or $t0, $v0, $zero #copia o valor do primeiro elemento da media para t0

li $v0, 5
syscall

or $t1, $v0, $zero #copia o valor do segundo elemento da media para t1

li $v0, 5
syscall

or $t2, $v0, $zero #copia o valor do terceiro elemento da media para t2 

#cria a subrotina para media 
jal media
nop

move $t5, $v0

la $a0, 0($t5) 

#comando para imprimir na tela
li $v0, 1
syscall

#comando para terminar o programa de subrotina
li $v0, 10
syscall

#move os valores para os argumentos abaixo
media: move $a0, $t0 

move $a1, $t1

move $a2, $t2

#realiação da media
add $t3, $a0, $a1
add $t3, $a2, $t3
div $t3, $s0
mflo $v0

li $t3, 0 #zerando o registrador

jr $ra
nop




