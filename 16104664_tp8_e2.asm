.data 
	tamanho: .byte 100

.text
ori $s0,$zero, 10
#comando para escrever uma string
li $v0, 8
la $a0, tamanho
li $a1, 100  #tamanho
syscall
	
	or $t0, $a0, $zero #copia o valor do endereço para o registrador t0
	lb $t2, 0($t0) 
	
        
loop: addi $t0, $t0, 1 #passa para outra palavra da memoria
      add $t1, $t1, $t2 
      addi $t1, $t1, -48 #converte o valor de char para inteiro voltando a tabela ascii
      lb $t2, 0($t0)
      
      #imprimi na tela o valor em inteiro
      li $v0, 1
      addi $a0, $t1, 0
      syscall
      
      beq $t2, $s0, fim  #verifica se foi digitado um /n
      nop
      
      mult $t1, $s1 #gera o valor de t1
      mflo $t1
      j loop
      nop
      
fim: li $v0, 10 #comando para acabar com o programa
     syscall
     
      
      
      