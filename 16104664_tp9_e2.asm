.data 
	str1: .asciiz "Entre com o N: "
        str2: .asciiz "Resultado final do fatorial: "
.text

la $a0, str1
li $v0, 4
syscall

li $v0, 5
syscall

li $s1, 1 #fatorial base da recursão
move $t1, $v0 #utiliza o maior valor como base
move $a0, $t1 #movendo o valor para o argumento

main: addi $sp, $sp, -4
      sw $ra, ($sp)
      
      beq $t1, $s1, fim #verifica se fez todas as multiplicações da recursão
      nop
      
      jal loop
      nop
      
      j main #faz a recursao fazendo os jumps
     
loop: addi $sp, $sp, -4
      sw $ra, ($sp)

      jal fatorial
      nop
       
      lw $ra, ($sp)
      addi $sp, $sp, 4
      
      jr $ra
      nop
           
fatorial: addi $sp, $sp, -4
          sw $ra, ($sp)
          
          subi $t1, $t1, 1
          
	  mult $t1, $a0 #resultado para o fatorial
          mflo $a0
          
          lw $ra, ($sp)
          addi $sp, $sp, 4
          
          jr $ra
          nop
          
fim:  lw $ra, ($sp)
      addi $sp, $sp, 4
      
      move $t1, $a0
      
      li $v0, 10
      syscall
