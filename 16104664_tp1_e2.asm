ori $t1, $zero, 0xA
sll $t1, $t1, 4

ori $t1, $t1, 0xA
sll $t1, $t1, 4

ori $t1, $t1, 0xA
sll $t1, $t1, 4

ori $t1, $t1, 0xA
sll $t1, $t1, 4

ori $t1, $t1, 0xA
sll $t1, $t1, 4

ori $t1, $t1, 0xA
sll $t1, $t1, 4

ori $t1, $t1, 0xA
sll $t1, $t1, 4     

ori $t1, $t1, 0xA

srl $t2, $t1, 1

#operações logicas

or $t3, $t1, $t2 
#uma or entre valores de 10101010101010101010101010101010 com o valor descolado 1 bit 01010101010101010101010101010101
#todos os valores vão ficar em 1 tornando o valor final 0xFFFFFFFF

and $t4, $t1, $t2
#uma or entre valores de 10101010101010101010101010101010 com o valor descolado 1 bit 01010101010101010101010101010101
#todos os valores vão ficar em 0 tornando o valor final 0x00000000

xor $t5, $t1, $t2
#uma or entre valores de 10101010101010101010101010101010 com o valor descolado 1 bit 01010101010101010101010101010101
#todos os valores vão ficar em 1 tornando o valor final 0xFFFFFFFF
