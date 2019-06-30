.data 
	vetor1: .word 1, 5, 4, 3, 5
	vetor2: .word 2, 3, 4, 6, 8
	saida: .space 10
.text

	lui $t0, 0x1001
	li $t1, 5 
	li $t2, 0 #contador1
	li $t3, 0 #contador2
	
loop1:	lw $t4, ($t0)
	
	beq $t1, $t2, loop2
	nop
	
	move $a0, $t4
	
	li $v0, 1
	syscall
	
	addi $t2, $t2, 1
	addi $t0, $t0, 4
	
	j loop1
	nop
	
loop2:	lw $t4, ($t0)
	
	beq $t3, $t2, fim
	nop
	
	move $a0, $t4
	
	li $v0, 1
	syscall
	
	addi $t3, $t3, 1
	addi $t0, $t0, 4
	
	j loop2
	nop
	
fim:	li $v0, 10
	syscall