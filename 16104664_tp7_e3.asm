.data

	vetor: .word 1 2 3 4 5 6 7 8 9 10
	
.text
la $t1, vetor
li $s0, 1 #contador
li $s1, 10

loop: lw $t2, 0($t1)
      lw $t3, 4($t1)
      
      beq $s0, $s1, fim #faz o laço 10 vezes antes de acabar, ou seja percorre todo o vetor
      nop
      slt $t0, $t2, $t3 #verificar se a posição atual e menor que a posição posterior
      beq $t0, 0, fim #testa se o vetor está desordenado
      nop
      
      #incremento da memoria e do contador
      addi $s0, $s0, 1
      addi $t1, $t1, 4
      j loop
      nop
      
fim: nop	

      
 	