li $t0, 150
li $t1, 230
li $t2, 991
li $t3, 0

#passa os valores para os argumentos
move $a0, $t0
move $a1, $t1
move $a2, $t2


main: addi $sp, $sp, -4
      sw $ra, ($sp)

jal soma3n
nop 

move $t3, $a0

li $v0, 10
syscall
  


soma3n: addi $sp, $sp, -4
	sw $ra, ($sp)
	
	jal soma
	nop
	
	move $a1, $a2
	
	jal soma
	nop
	
	lw $ra, ($sp)
	addi $sp, $sp, 4
	
	jr $ra
	nop
	
soma: addi $sp, $sp, -4
      sw $ra, ($sp)
      
      add $a0, $a0, $a1
      
      lw $ra, ($sp)
      addi $sp, $sp, 4
      
      jr $ra
      nop
      								
