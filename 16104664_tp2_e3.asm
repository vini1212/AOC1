ori $t0, $zero, 0x7000
sll $t0, $t0, 16

#usar instru��o addu para somar o conteudo a si mesmo

addu $t0, $t0, $t0
#add $t0, $t0, $t0 


#o resultado est� correto pois no addu n�o considera complemento de 2 de 0x70000000 com 0x70000000 fazendo uma soma sem sinal 
#utilizando o apenas add ir� mostrar aritm�tica de overflow pois a soma vai ter um bit diferente de "vai-um", dando "0 e 1" ocorrendo o caso de overflow quando substituimos ADDU por ADD, portanto dando o resultado errado passando os bits de representa��o
