.data
	vetor: .word 1 2 3 4 5
	
.text

la $t0, vetor #um ponteiro aponta para o começo do vetor para fazer a troca
la $t1, vetor+16 #um ponteiro aponta para o final do vetor para fazer a troca

loop: lw $t2, 0($t0)
      lw $t3, 0($t1)
      
      beq $t0, $t1, fim
      nop
      
      sw $t2, 0($t1)
      sw $t3, 0($t0)
      
      addi $t0, $t0, 4
      subi $t1, $t1, 4
      
      j loop
      nop
          
fim: nop      