ori $t1, $0, 1
sll $s1, $t1, 0
ori $s2, $zero, 1
ori $s3, $zero, 32
sll $s2, $s2, 31

beq $t0, $zero, zero
sll $0, $0, 0
beq $t0, $s2, fim 
sll $zero, $zero, 0

teste: sll $t0, $t0, 1 
	and $t3, $s2, $t0 
	addi $t8, $t8, 1 #contador
	
	beq $t6, $s2, fim 
	sll $0, $0, 0 
	j teste
	sll $0, $0, 0

fim:  sub $t2, $s3, $t8 
      sll $0, $0, 0
	
zero: #fim do programa
