#Escreva um programa que receba dois números em complemento de dois
#(armazenados em $s0 e $s1). Procure em um vetor (com início endereçado em $s3 e
#tamanho armazenado em $s4) quantos números existem com valores dentro do
#intervalo fechado definido por $s0 e $s1. Assuma que $s0 ? $s1.
#Utilize os registradores $s3 e $s4 apenas para armazenar o início e o tamanho do
#vetor.

.data 
     a: .word 5
     b: .word 7
     c: .word 10
.text

lui $s3, 0x1001

or $t1, $zero, $s3 #copia o valor da memoria inicial para fazer alteração
ori $s0, $zero, 1 #intervalo min
ori $s1, $zero, 10 #intervalo max
ori $s4, $zero, 3 #tamanho do vetor
ori $t0, $zero, 0 #contador1 para verificar se aparece entre o intervalo
ori $t3, $zero, 0 #contador2

teste: beq $t0, $s4, fim
           nop
       		lw $t2, 0($t1) 
       		beq $s0, $t2, soma
       		nop
       	              slt $t7, $s0, $t2
       		      beq $t7, $zero, inf #se o valor nao estiver dentro do intervalo ele precisa passar para outro valor da memoria
       		      nop
       		      slt $t7, $t2, $s1
       		      bne $t7, $zero, soma #se o valor for menor que o intervalo maximo ele faz a soma
       		      nop
       		      beq $t2, $s1, soma #se o valor nao for menor, verifica se for igual
       		      nop
       		      j inf
       		      nop
       soma: addi $t0, $t0, 1
       inf: addi $t1, $t1, 4
       addi $t3, $t3, 1
       j teste
       nop
       
fim: #finaliza o programa		
       		
       		
      
         
       
    
