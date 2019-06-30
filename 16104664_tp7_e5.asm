.data
tamanho: .word 7
vetor1: .word -30, -23, 56, -43, 72, -18, 71
vetor2: .word 45, 23, 21, -23, -82, 0, 69
soma: .word 0, 0, 0, 0, 0, 0, 0

.text

la $t0, vetor1
la $t1, vetor2
la $t2, soma
li $t5, 1 #contador
li $t6, 7 #tamanho do vetor

loop: lw $t3, 0($t0) #primeiro vetor
      lw $t4, 0($t1) #segundo vetor

      slti $t7, $t5, 7
      add $s0, $t3, $t4
      
      addi $t0, $t0, 4#proximo elemento
      addi $t1, $t1, 4#proximo elemnto
      addi $t5, $t5, 1#incrementa o contador
      
      addi $t2, $t2, 4
      sw $s0, 0($t2)
      
      beq $t7, $zero, fim
      nop
      
      j loop
      nop
      
fim: nop

